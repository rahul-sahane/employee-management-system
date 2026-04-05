// ===== LUMINOUS EXECUTIVE SPA ENGINE =====
// Backend-Ready: All CRUD operations call backend functions.
// Wire up servlets in the fetchEmployees(), addEmployeeToBackend(), etc. functions below.

const COLORS = ['#22d3ee','#a78bfa','#34d399','#f472b6','#fb923c','#60a5fa','#facc15','#f87171'];
function avatarColor(name){ let h=0; for(let i=0;i<name.length;i++) h=name.charCodeAt(i)+((h<<5)-h); return COLORS[Math.abs(h)%COLORS.length]; }
function initials(name){ return name.split(' ').map(w=>w[0]).join('').toUpperCase().slice(0,2); }
function fmt$(n){ return '$'+Number(n).toLocaleString(); }

const DEPARTMENTS = ['Engineering','Product Design','Marketing','Operations','Human Resources','Executive'];
const ROLES = ['Senior Associate','Lead Director','Principal Engineer','VP of Operations','Cloud Architect','Senior Design Lead','UX Researcher','Brand Strategist','HR Director','Creative Director','SEO Specialist','Financial Analyst'];

// ===== EMPLOYEE DATA (Loaded from backend when connected) =====
let employees = [];

// ===== BACKEND API BASE URL =====
// Change the port/context if your Tomcat configuration is different
const BASE_URL = 'http://localhost:9090/SmartEmployeeManagement/EmployeeServlet';

// ===== BACKEND API FUNCTIONS =====
// All logic & messages handled by Servlet. JS only sends data, shows response, refreshes UI.

function fetchEmployees() {
  fetch(BASE_URL + '?action=list')
    .then(res => res.json())
    .then(data => {
      employees = (data.employees || []).map(e => ({ ...e, salary: Number(e.salary) || 0 }));
      if (data.message) toast(data.message, data.success ? 'success' : 'error');
      renderView(getCurrentRoute());
    })
    .catch(() => toast('Server not reachable.', 'error'));
}

function addEmployeeToBackend(emp) {
  const params = new URLSearchParams();
  params.append('action', 'add');
  params.append('name', emp.name);
  params.append('email', emp.email);
  params.append('phone', emp.phone);
  params.append('department', emp.department);
  params.append('role', emp.role);
  params.append('salary', emp.salary);
  params.append('status', emp.status);

  fetch(BASE_URL, { method: 'POST', body: params })
    .then(res => res.json())
    .then(data => {
      toast(data.message, data.success ? 'success' : 'error');
      if (data.success) { fetchEmployees(); navigate('employees'); }
    })
    .catch(() => toast('Server not reachable.', 'error'));
}

function updateEmployeeInBackend(emp) {
  const params = new URLSearchParams();
  params.append('action', 'update');
  params.append('id', emp.id);
  params.append('name', emp.name);
  params.append('email', emp.email);
  params.append('phone', emp.phone);
  params.append('department', emp.department);
  params.append('role', emp.role);
  params.append('salary', emp.salary);
  params.append('status', emp.status);

  fetch('EmployeeServlet', { method: 'POST', body: params })
    .then(res => res.json())
    .then(data => {
      toast(data.message, data.success ? 'success' : 'error');
      if (data.success) { fetchEmployees(); navigate('employees'); }
    })
    .catch(() => toast('Server not reachable.', 'error'));
}

function deleteEmployeeFromBackend(id) {
  fetch(BASE_URL + '?action=delete&id=' + id)
    .then(res => res.json())
    .then(data => {
      toast(data.message, data.success ? 'success' : 'error');
      if (data.success) fetchEmployees();
    })
    .catch(() => toast('Server not reachable.', 'error'));
}

// ===== TOAST =====
function toast(msg, type='success'){
  const c = document.getElementById('toast-container');
  const t = document.createElement('div'); t.className = `toast ${type}`;
  const icon = type==='success'?'check_circle':type==='error'?'error':'info';
  t.innerHTML = `<span class="material-symbols-outlined" style="font-size:20px">${icon}</span><span>${msg}</span>`;
  c.appendChild(t);
  setTimeout(()=>{ t.classList.add('removing'); setTimeout(()=>t.remove(),300); },4000);
}

// ===== MODAL =====
function showModal(title, message, onConfirm){
  const o = document.createElement('div'); o.className='modal-overlay'; o.id='active-modal';
  o.innerHTML = `<div class="modal"><h3 style="font-size:1.25rem;font-weight:700;margin-bottom:.75rem">${title}</h3>
    <p style="color:var(--on-surface-variant);font-size:14px;margin-bottom:1.5rem;line-height:1.6">${message}</p>
    <div style="display:flex;gap:12px;justify-content:flex-end">
      <button class="btn btn-ghost" onclick="closeModal()">Cancel</button>
      <button class="btn btn-danger" id="modal-confirm-btn">Confirm</button></div></div>`;
  document.body.appendChild(o);
  o.querySelector('#modal-confirm-btn').onclick = ()=>{ onConfirm(); closeModal(); };
  o.onclick = (e)=>{ if(e.target===o) closeModal(); };
}
function closeModal(){ const m=document.getElementById('active-modal'); if(m) m.remove(); }

// ===== ROUTER =====
const routes = { dashboard:'dashboard', employees:'employees', 'add-employee':'add-employee',
  'delete-employee':'delete-employee', 'update-employee':'update-employee', search:'search', settings:'settings', logout:'logout' };

function navigate(route){
  if(location.hash !== '#/'+route) history.pushState(null,null,'#/'+route);
  document.querySelectorAll('.view').forEach(v=>v.classList.remove('active'));
  const view = document.getElementById('view-'+route);
  if(view){ view.classList.add('active'); renderView(route); }
  document.querySelectorAll('.nav-item').forEach(n=>{
    n.classList.toggle('active', n.dataset.route===route);
  });
}
window.addEventListener('popstate',()=>{ const r=(location.hash||'#/dashboard').replace('#/',''); navigate(r); });

// ===== RENDER VIEWS =====
function renderView(route){
  switch(route){
    case 'dashboard': renderDashboard(); break;
    case 'employees': renderEmployees(); break;
    case 'add-employee': renderAddEmployee(); break;
    case 'delete-employee': renderDeleteEmployee(); break;
    case 'update-employee': renderUpdateEmployee(); break;
    case 'search': renderSearch(); break;
    case 'settings': renderSettings(); break;
    case 'logout': renderLogout(); break;
  }
}

// ===== DASHBOARD =====
function renderDashboard(){
  const total = employees.length;
  const active = employees.filter(e=>e.status==='active').length;
  const depts = [...new Set(employees.map(e=>e.department))].length;
  const payroll = employees.filter(e=>e.status==='active').reduce((s,e)=>s+(Number(e.salary)||0),0);
  const recent = [...employees].sort((a,b)=>new Date(b.joinDate)-new Date(a.joinDate)).slice(0,4);
  const deptStats = {};
  employees.forEach(e=>{ deptStats[e.department]=(deptStats[e.department]||0)+1; });
  const deptArr = Object.entries(deptStats).sort((a,b)=>b[1]-a[1]);
  const clrs = {Engineering:'var(--primary)',Marketing:'var(--tertiary)','Product Design':'var(--secondary)',Operations:'var(--on-surface-variant)','Human Resources':'#f472b6',Executive:'#facc15'};

  document.getElementById('view-dashboard').innerHTML = `
    <div class="section-header"><h2>Welcome back, Curator.</h2>
      <p>Your organizational performance overview.${total>0?' '+total+' employees across '+depts+' departments.':''}</p></div>
    <div class="kpi-grid" style="margin-bottom:3rem">
      <div class="glass-card kpi-card"><div class="accent-bar" style="background:var(--primary)"></div>
        <div style="display:flex;justify-content:space-between;align-items:start;margin-bottom:1rem">
          <div class="kpi-icon" style="background:rgba(143,245,255,0.1);color:var(--primary)"><span class="material-symbols-outlined">group</span></div>
          <span class="kpi-badge" style="background:rgba(0,233,191,0.1);color:var(--tertiary-dim)">Total</span></div>
        <p class="kpi-label">Total Employees</p><h3 class="kpi-value">${total}</h3></div>
      <div class="glass-card kpi-card"><div class="accent-bar" style="background:var(--tertiary)"></div>
        <div style="display:flex;justify-content:space-between;align-items:start;margin-bottom:1rem">
          <div class="kpi-icon" style="background:rgba(185,255,232,0.1);color:var(--tertiary)"><span class="material-symbols-outlined">verified</span></div>
          <span style="display:flex;align-items:center;gap:4px;color:var(--tertiary)"><span style="width:8px;height:8px;border-radius:50%;background:var(--tertiary);display:inline-block"></span><span style="font-size:11px;font-weight:700">${total?Math.round(active/total*100):0}%</span></span></div>
        <p class="kpi-label">Active Now</p><h3 class="kpi-value">${active}</h3></div>
      <div class="glass-card kpi-card"><div class="accent-bar" style="background:var(--secondary)"></div>
        <div style="margin-bottom:1rem"><div class="kpi-icon" style="background:rgba(172,137,255,0.1);color:var(--secondary)"><span class="material-symbols-outlined">hub</span></div></div>
        <p class="kpi-label">Departments</p><h3 class="kpi-value">${depts}</h3></div>
      <div class="glass-card kpi-card"><div class="accent-bar" style="background:linear-gradient(180deg,var(--primary),var(--secondary))"></div>
        <div style="margin-bottom:1rem"><div class="kpi-icon" style="background:rgba(143,245,255,0.05);color:var(--primary)"><span class="material-symbols-outlined">payments</span></div></div>
        <p class="kpi-label">Monthly Payroll</p><h3 class="kpi-value">${total>0?fmt$(Math.round(payroll/12)):'$0'}</h3></div>
    </div>
    <div style="display:grid;grid-template-columns:2fr 1fr;gap:3rem">
      <div><div style="display:flex;justify-content:space-between;align-items:end;margin-bottom:1.5rem">
        <div><h4 style="font-size:1.5rem;font-weight:700">Recent Talent Activity</h4><p style="color:var(--on-surface-variant);font-size:14px">Latest employees in the system</p></div>
        ${total>0?'<button class="btn btn-sm btn-ghost" onclick="navigate(\'employees\')">View All</button>':''}</div>
        ${recent.length>0?`<div style="display:flex;flex-direction:column;gap:12px">${recent.map(e=>`
          <div class="glass-card" style="padding:1.25rem;display:flex;align-items:center;cursor:pointer;border-radius:12px" onclick="navigate('employees')">
            <div class="emp-avatar" style="background:${avatarColor(e.name)};color:#000;margin-right:1rem">${initials(e.name)}</div>
            <div style="flex:1"><h5 style="font-weight:600;font-size:14px">${e.name}</h5><p style="font-size:12px;color:var(--on-surface-variant)">${e.role} • ${e.department}</p></div>
            <div style="text-align:right"><span class="status-badge ${e.status==='active'?'status-active':'status-inactive'}">${e.status}</span></div>
          </div>`).join('')}</div>`
          :`<div class="empty-state" style="padding:3rem"><span class="material-symbols-outlined icon">database</span>
            <h3>No Employees Yet</h3><p>Employee data will appear here once the backend database is connected.</p></div>`}
      </div>
      <div class="glass-card" style="padding:2rem;height:fit-content">
        <h4 style="font-size:1.25rem;font-weight:700;margin-bottom:1.5rem">Department Hubs</h4>
        ${deptArr.length>0?`<div style="display:flex;flex-direction:column;gap:1.25rem">${deptArr.map(([d,c])=>`
          <div><div style="display:flex;justify-content:space-between;font-size:13px;margin-bottom:6px">
            <span style="color:var(--on-surface-variant)">${d}</span><span style="font-weight:700">${Math.round(c/total*100)}%</span></div>
            <div class="dept-bar-track"><div class="dept-bar-fill" style="width:${c/total*100}%;background:${clrs[d]||'var(--primary)'}"></div></div></div>`).join('')}</div>`
          :`<div style="text-align:center;padding:2rem;color:var(--on-surface-variant)">
            <span class="material-symbols-outlined" style="font-size:40px;opacity:0.3;display:block;margin-bottom:0.5rem">pie_chart</span>
            <p style="font-size:13px">Department data will load from the database.</p></div>`}
      </div>
    </div>`;
}

// ===== EMPLOYEES DIRECTORY =====
let empFilter = { search:'', dept:'All', status:'All' };
function renderEmployees(){
  let list = [...employees];
  if(empFilter.search){ const s=empFilter.search.toLowerCase(); list=list.filter(e=>e.name.toLowerCase().includes(s)||e.email.toLowerCase().includes(s)||e.role.toLowerCase().includes(s)); }
  if(empFilter.dept!=='All') list=list.filter(e=>e.department===empFilter.dept);
  if(empFilter.status!=='All') list=list.filter(e=>e.status===empFilter.status);

  document.getElementById('view-employees').innerHTML = `
    <div class="section-header"><h2>Employee Directory</h2><p>Browse, filter, and manage your entire workforce.</p></div>
    <div class="filter-bar" style="margin-bottom:2rem">
      <div class="search-box"><span class="material-symbols-outlined search-icon">search</span>
        <input type="text" placeholder="Search by name, email, or role..." id="emp-search" value="${empFilter.search}"></div>
      <select class="form-select" style="width:auto;min-width:160px;padding:10px 16px;border-radius:20px;font-size:13px" id="emp-dept-filter">
        <option value="All">All Departments</option>${DEPARTMENTS.map(d=>`<option value="${d}" ${empFilter.dept===d?'selected':''}>${d}</option>`).join('')}</select>
      <select class="form-select" style="width:auto;min-width:120px;padding:10px 16px;border-radius:20px;font-size:13px" id="emp-status-filter">
        <option value="All" ${empFilter.status==='All'?'selected':''}>All Status</option>
        <option value="active" ${empFilter.status==='active'?'selected':''}>Active</option>
        <option value="inactive" ${empFilter.status==='inactive'?'selected':''}>Inactive</option></select>
      <span style="color:var(--on-surface-variant);font-size:13px;font-weight:500">${list.length} results</span>
    </div>
    ${list.length?`<div class="glass-card" style="overflow:hidden"><table class="data-table"><thead><tr>
      <th>Employee</th><th>Department</th><th>Role</th><th>Salary</th><th>Status</th><th>Actions</th></tr></thead><tbody>
      ${list.map(e=>`<tr><td style="display:flex;align-items:center;gap:12px">
        <div class="emp-avatar" style="background:${avatarColor(e.name)};color:#000">${initials(e.name)}</div>
        <div><div style="font-weight:600">${e.name}</div><div style="font-size:12px;color:var(--on-surface-variant)">${e.email}</div></div></td>
        <td>${e.department}</td><td>${e.role}</td><td style="font-weight:600">${fmt$(e.salary)}</td>
        <td><span class="status-badge ${e.status==='active'?'status-active':'status-inactive'}">${e.status}</span></td>
        <td><button class="btn btn-sm btn-ghost" style="margin-right:4px" onclick="editEmployee('${e.id}')"><span class="material-symbols-outlined" style="font-size:16px">edit</span></button>
        <button class="btn btn-sm btn-danger" onclick="confirmDeleteSingle('${e.id}')"><span class="material-symbols-outlined" style="font-size:16px">delete</span></button></td></tr>`).join('')}
      </tbody></table></div>`
      :`<div class="empty-state"><span class="material-symbols-outlined icon">group_off</span>
        <h3>${employees.length===0?'No Employees in Database':'No Results Found'}</h3>
        <p>${employees.length===0?'Employee records will appear here once the backend database is connected.':'Try adjusting your filters or search terms.'}</p></div>`}`;

  document.getElementById('emp-search').addEventListener('input', e=>{ empFilter.search=e.target.value; renderEmployees(); });
  document.getElementById('emp-dept-filter').addEventListener('change', e=>{ empFilter.dept=e.target.value; renderEmployees(); });
  document.getElementById('emp-status-filter').addEventListener('change', e=>{ empFilter.status=e.target.value; renderEmployees(); });
}

// ===== ADD EMPLOYEE =====
function renderAddEmployee(){
  document.getElementById('view-add-employee').innerHTML = `
    <div class="section-header"><h2>Add New Employee</h2><p>Onboard a new executive to the Luminous ecosystem.</p></div>
    <div class="glass-card" style="max-width:720px">
      <form id="add-emp-form" style="padding:2rem">
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:1.5rem">
          <div class="form-group" style="grid-column:span 2"><label class="form-label">Full Name *</label>
            <input class="form-input" id="ae-name" placeholder="e.g. Jane Doe" required></div>
          <div class="form-group"><label class="form-label">Email Address *</label>
            <input class="form-input" id="ae-email" type="email" placeholder="jane@luminous.io" required></div>
          <div class="form-group"><label class="form-label">Phone Number</label>
            <input class="form-input" id="ae-phone" placeholder="+1 (555) 000-0000"></div>
          <div class="form-group"><label class="form-label">Department *</label>
            <select class="form-select" id="ae-dept">${DEPARTMENTS.map(d=>`<option>${d}</option>`).join('')}</select></div>
          <div class="form-group"><label class="form-label">Role *</label>
            <select class="form-select" id="ae-role">${ROLES.map(r=>`<option>${r}</option>`).join('')}</select></div>
          <div class="form-group"><label class="form-label">Annual Salary (USD) *</label>
            <input class="form-input" id="ae-salary" type="number" placeholder="120000" required></div>
          <div class="form-group"><label class="form-label">Status</label>
            <select class="form-select" id="ae-status"><option value="active">Active</option><option value="inactive">Inactive</option></select></div>
        </div>
      </form>
      <div style="padding:1.5rem 2rem;border-top:1px solid rgba(255,255,255,0.05);display:flex;justify-content:flex-end;gap:12px;background:rgba(28,32,40,0.4)">
        <button class="btn btn-ghost" onclick="navigate('dashboard')"><span class="material-symbols-outlined" style="font-size:18px">close</span> Cancel</button>
        <button class="btn btn-primary" onclick="addEmployee()"><span class="material-symbols-outlined" style="font-size:18px">person_add</span> Save Employee</button></div>
    </div>`;
}
function addEmployee(){
  const n=document.getElementById('ae-name').value.trim(), e=document.getElementById('ae-email').value.trim(),
    p=document.getElementById('ae-phone').value.trim(), d=document.getElementById('ae-dept').value,
    r=document.getElementById('ae-role').value, s=document.getElementById('ae-salary').value,
    st=document.getElementById('ae-status').value;
  if(!n||!e||!s){ toast('Please fill all required fields.','error'); return; }
  const emp = {name:n, email:e, phone:p, department:d, role:r, salary:Number(s), status:st};
  addEmployeeToBackend(emp);
}

// ===== DELETE EMPLOYEE =====
function renderDeleteEmployee(){
  document.getElementById('view-delete-employee').innerHTML = `
    <div class="section-header"><h2>Remove Employees</h2><p>Select employees to remove from the organization.</p></div>
    ${employees.length>0?`
    <div class="filter-bar" style="margin-bottom:1.5rem">
      <div class="search-box"><span class="material-symbols-outlined search-icon">search</span>
        <input type="text" placeholder="Search employees..." id="del-search"></div>
    </div>
    <div class="glass-card" style="overflow:hidden">
      <table class="data-table"><thead><tr><th style="width:50px"><input type="checkbox" id="del-select-all"></th>
        <th>Employee</th><th>Department</th><th>Status</th><th>Action</th></tr></thead>
        <tbody id="del-tbody">${employees.map(e=>`<tr data-id="${e.id}" class="del-row">
          <td><input type="checkbox" class="del-check" value="${e.id}"></td>
          <td style="display:flex;align-items:center;gap:12px"><div class="emp-avatar" style="background:${avatarColor(e.name)};color:#000">${initials(e.name)}</div>
            <div><div style="font-weight:600">${e.name}</div><div style="font-size:12px;color:var(--on-surface-variant)">${e.email}</div></div></td>
          <td>${e.department}</td><td><span class="status-badge ${e.status==='active'?'status-active':'status-inactive'}">${e.status}</span></td>
          <td><button class="btn btn-sm btn-danger" onclick="confirmDeleteSingle('${e.id}')"><span class="material-symbols-outlined" style="font-size:16px">delete</span> Remove</button></td>
        </tr>`).join('')}</tbody></table></div>
    <div style="margin-top:1rem;display:flex;gap:12px;justify-content:flex-end">
      <button class="btn btn-ghost" onclick="navigate('dashboard')">Cancel</button>
      <button class="btn btn-danger" onclick="deleteSelected()"><span class="material-symbols-outlined" style="font-size:18px">delete_sweep</span> Delete Selected</button></div>`
    :`<div class="empty-state"><span class="material-symbols-outlined icon">person_off</span>
      <h3>No Employees to Remove</h3><p>Employee records will appear here once the backend database is connected.</p>
      <button class="btn btn-ghost" style="margin-top:1rem" onclick="navigate('dashboard')"><span class="material-symbols-outlined" style="font-size:18px">arrow_back</span> Back to Dashboard</button></div>`}`;

  if(employees.length>0){
    document.getElementById('del-select-all').onchange = function(){ document.querySelectorAll('.del-check').forEach(c=>c.checked=this.checked); };
    document.getElementById('del-search').addEventListener('input', function(){
      const s=this.value.toLowerCase();
      document.querySelectorAll('.del-row').forEach(r=>{ r.style.display=r.textContent.toLowerCase().includes(s)?'':'none'; });
    });
  }
}
function confirmDeleteSingle(id){
  const e=employees.find(x=>x.id===id); if(!e) return;
  showModal('Remove Employee',`Are you sure you want to remove <strong>${e.name}</strong>? This action cannot be undone.`,
    ()=>{ deleteEmployeeFromBackend(id); });
}
function deleteSelected(){
  const ids=[...document.querySelectorAll('.del-check:checked')].map(c=>c.value);
  if(!ids.length){ toast('No employees selected.','error'); return; }
  showModal('Delete Selected',`Remove <strong>${ids.length}</strong> employee(s)? This cannot be undone.`,
    ()=>{ ids.forEach(id => deleteEmployeeFromBackend(id)); });
}

// ===== UPDATE EMPLOYEE =====
let editingId = null;
function renderUpdateEmployee(){
  document.getElementById('view-update-employee').innerHTML = `
    <div class="section-header"><h2>Update Employee</h2><p>Select an employee to modify their details.</p></div>
    ${employees.length>0?`
    <div class="filter-bar" style="margin-bottom:1.5rem">
      <div class="search-box"><span class="material-symbols-outlined search-icon">search</span>
        <input type="text" placeholder="Search employees to edit..." id="upd-search"></div></div>
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem" id="upd-grid">
      ${employees.map(e=>`<div class="glass-card" style="padding:1.25rem;display:flex;align-items:center;cursor:pointer;border-radius:12px" onclick="editEmployee('${e.id}')">
        <div class="emp-avatar" style="background:${avatarColor(e.name)};color:#000;margin-right:1rem">${initials(e.name)}</div>
        <div style="flex:1"><h5 style="font-weight:600;font-size:14px">${e.name}</h5><p style="font-size:12px;color:var(--on-surface-variant)">${e.role} • ${e.department}</p></div>
        <span class="material-symbols-outlined" style="color:var(--on-surface-variant)">edit</span></div>`).join('')}
    </div>`
    :`<div class="empty-state"><span class="material-symbols-outlined icon">edit_off</span>
      <h3>No Employees to Update</h3><p>Employee records will appear here once the backend database is connected.</p>
      <button class="btn btn-ghost" style="margin-top:1rem" onclick="navigate('dashboard')"><span class="material-symbols-outlined" style="font-size:18px">arrow_back</span> Back to Dashboard</button></div>`}`;

  if(employees.length>0){
    document.getElementById('upd-search').addEventListener('input', function(){
      const s=this.value.toLowerCase();
      document.querySelectorAll('#upd-grid .glass-card').forEach(c=>{ c.style.display=c.textContent.toLowerCase().includes(s)?'':'none'; });
    });
  }
}
function editEmployee(id){
  editingId=id; const e=employees.find(x=>x.id===id); if(!e) return;
  navigate('update-employee');
  setTimeout(()=>{
    document.getElementById('view-update-employee').innerHTML = `
      <div style="display:flex;align-items:center;gap:12px;margin-bottom:2rem">
        <button class="btn btn-ghost btn-sm" onclick="navigate('update-employee')"><span class="material-symbols-outlined" style="font-size:18px">arrow_back</span> Back</button>
        <div><h2 style="font-size:1.75rem;font-weight:800">Edit: ${e.name}</h2></div></div>
      <div class="glass-card" style="max-width:720px">
        <form style="padding:2rem"><div style="display:grid;grid-template-columns:1fr 1fr;gap:1.5rem">
          <div class="form-group" style="grid-column:span 2"><label class="form-label">Full Name</label><input class="form-input" id="ue-name" value="${e.name}"></div>
          <div class="form-group"><label class="form-label">Email</label><input class="form-input" id="ue-email" value="${e.email}" type="email"></div>
          <div class="form-group"><label class="form-label">Phone</label><input class="form-input" id="ue-phone" value="${e.phone||''}"></div>
          <div class="form-group"><label class="form-label">Department</label><select class="form-select" id="ue-dept">${DEPARTMENTS.map(d=>`<option ${d===e.department?'selected':''}>${d}</option>`).join('')}</select></div>
          <div class="form-group"><label class="form-label">Role</label><select class="form-select" id="ue-role">${ROLES.map(r=>`<option ${r===e.role?'selected':''}>${r}</option>`).join('')}</select></div>
          <div class="form-group"><label class="form-label">Salary</label><input class="form-input" id="ue-salary" type="number" value="${e.salary}"></div>
          <div class="form-group"><label class="form-label">Status</label><select class="form-select" id="ue-status"><option value="active" ${e.status==='active'?'selected':''}>Active</option><option value="inactive" ${e.status==='inactive'?'selected':''}>Inactive</option></select></div>
        </div></form>
        <div style="padding:1.5rem 2rem;border-top:1px solid rgba(255,255,255,0.05);display:flex;justify-content:flex-end;gap:12px;background:rgba(28,32,40,0.4)">
          <button class="btn btn-ghost" onclick="navigate('update-employee')">Cancel</button>
          <button class="btn btn-primary" onclick="saveUpdate()"><span class="material-symbols-outlined" style="font-size:18px">save</span> Update Employee</button></div></div>`;
  },50);
}
function saveUpdate(){
  const emp = { id: editingId, name:document.getElementById('ue-name').value, email:document.getElementById('ue-email').value,
    phone:document.getElementById('ue-phone').value, department:document.getElementById('ue-dept').value,
    role:document.getElementById('ue-role').value, salary:Number(document.getElementById('ue-salary').value),
    status:document.getElementById('ue-status').value };
  updateEmployeeInBackend(emp);
}

// ===== SEARCH =====
function renderSearch(){
  document.getElementById('view-search').innerHTML = `
    <div class="section-header"><h2>Global Search</h2><p>Find employees across all departments and roles.</p></div>
    <div style="position:relative;margin-bottom:2rem"><span class="material-symbols-outlined" style="position:absolute;left:20px;top:50%;transform:translateY(-50%);color:var(--on-surface-variant);font-size:24px">search</span>
      <input class="form-input" style="padding:18px 20px 18px 56px;font-size:16px;border-radius:16px" placeholder="Type to search employees..." id="global-search" autofocus></div>
    <div id="search-results">${employees.length===0
      ?'<div class="empty-state"><span class="material-symbols-outlined icon">database</span><h3>No Data Available</h3><p>Search will work once the backend database is connected and employees are loaded.</p></div>'
      :'<div class="empty-state"><span class="material-symbols-outlined icon">manage_search</span><h3>Start searching</h3><p>Type a name, email, department, or role to find employees.</p></div>'
    }</div>`;

  document.getElementById('global-search').addEventListener('input', function(){
    const s=this.value.toLowerCase().trim(); const out=document.getElementById('search-results');
    if(employees.length===0){ out.innerHTML='<div class="empty-state"><span class="material-symbols-outlined icon">database</span><h3>No Data Available</h3><p>Search will work once the backend database is connected.</p></div>'; return; }
    if(!s){ out.innerHTML='<div class="empty-state"><span class="material-symbols-outlined icon">manage_search</span><h3>Start searching</h3><p>Type a name, email, department, or role.</p></div>'; return; }
    const results=employees.filter(e=>e.name.toLowerCase().includes(s)||e.email.toLowerCase().includes(s)||e.department.toLowerCase().includes(s)||e.role.toLowerCase().includes(s));
    if(!results.length){ out.innerHTML='<div class="empty-state"><span class="material-symbols-outlined icon">search_off</span><h3>No results</h3><p>Try a different search term.</p></div>'; return; }
    out.innerHTML=`<p style="color:var(--on-surface-variant);font-size:13px;margin-bottom:1rem">${results.length} result(s)</p><div style="display:flex;flex-direction:column;gap:8px">${results.map(e=>`
      <div class="glass-card" style="padding:1rem 1.5rem;display:flex;align-items:center;border-radius:12px;cursor:pointer" onclick="editEmployee('${e.id}')">
        <div class="emp-avatar" style="background:${avatarColor(e.name)};color:#000;margin-right:1rem">${initials(e.name)}</div>
        <div style="flex:1"><div style="font-weight:600">${e.name}</div><div style="font-size:12px;color:var(--on-surface-variant)">${e.email} • ${e.role} • ${e.department}</div></div>
        <span class="status-badge ${e.status==='active'?'status-active':'status-inactive'}">${e.status}</span></div>`).join('')}</div>`;
  });
}

// ===== SETTINGS =====
function renderSettings(){
  document.getElementById('view-settings').innerHTML = `
    <div class="section-header"><h2>Settings</h2><p>Configure your Luminous Executive preferences.</p></div>
    <div class="glass-card" style="max-width:640px;padding:2rem">
      <h4 style="font-weight:700;font-size:1.1rem;margin-bottom:1.5rem">Preferences</h4>
      <div style="display:flex;flex-direction:column;gap:1.5rem">
        <div style="display:flex;justify-content:space-between;align-items:center"><div><p style="font-weight:600">Dark Mode</p><p style="font-size:12px;color:var(--on-surface-variant)">Toggle dark theme</p></div><label class="toggle"><input type="checkbox" checked><span class="slider"></span></label></div>
        <div style="display:flex;justify-content:space-between;align-items:center"><div><p style="font-weight:600">Notifications</p><p style="font-size:12px;color:var(--on-surface-variant)">Enable desktop notifications</p></div><label class="toggle"><input type="checkbox"><span class="slider"></span></label></div>
        <div style="display:flex;justify-content:space-between;align-items:center"><div><p style="font-weight:600">Auto-save</p><p style="font-size:12px;color:var(--on-surface-variant)">Automatically save changes</p></div><label class="toggle"><input type="checkbox" checked><span class="slider"></span></label></div>
      </div>
      <div style="border-top:1px solid rgba(255,255,255,0.05);margin-top:2rem;padding-top:1.5rem">
        <h4 style="font-weight:700;margin-bottom:1rem">System Info</h4>
        <div style="display:flex;flex-direction:column;gap:8px;font-size:13px;color:var(--on-surface-variant)">
          <p><strong style="color:var(--on-surface)">Backend Status:</strong> <span style="color:var(--error)">Not Connected</span></p>
          <p><strong style="color:var(--on-surface)">Database:</strong> <span style="color:var(--error)">Not Configured</span></p>
          <p><strong style="color:var(--on-surface)">Employees Loaded:</strong> ${employees.length}</p>
        </div></div></div>`;
}

// ===== LOGOUT =====
function renderLogout(){
  document.getElementById('view-logout').innerHTML = `
    <div style="display:flex;align-items:center;justify-content:center;min-height:60vh">
      <div class="glass-card" style="max-width:480px;padding:3rem;text-align:center">
        <div style="width:80px;height:80px;border-radius:50%;background:var(--surface-container);border:1px solid rgba(143,245,255,0.3);display:flex;align-items:center;justify-content:center;margin:0 auto 2rem"><span class="material-symbols-outlined" style="font-size:36px;color:var(--primary);font-variation-settings:'FILL' 1">logout</span></div>
        <h2 style="font-size:2rem;font-weight:800;margin-bottom:0.75rem">Ready to sign out?</h2>
        <p style="color:var(--on-surface-variant);margin-bottom:2rem">Your session in <span style="color:var(--primary);font-weight:600">Luminous Executive</span> will end.</p>
        <div style="display:flex;gap:12px;justify-content:center">
          <button class="btn btn-ghost" onclick="navigate('dashboard')"><span class="material-symbols-outlined" style="font-size:18px">arrow_back</span> Return</button>
          <button class="btn btn-primary" onclick="toast('Backend not connected — Logout will work once session management is configured.','info')"><span class="material-symbols-outlined" style="font-size:18px">logout</span> Sign Out</button></div></div></div>`;
}

// ===== HELPERS =====
function getCurrentRoute(){ return (location.hash||'#/dashboard').replace('#/',''); }

// ===== INIT =====
document.addEventListener('DOMContentLoaded',()=>{
  document.querySelectorAll('.nav-item').forEach(n=>{
    n.addEventListener('click', e=>{ e.preventDefault(); navigate(n.dataset.route); });
  });
  fetchEmployees(); // Load employees from backend on page load
  const route = (location.hash||'#/dashboard').replace('#/','');
  navigate(routes[route]||'dashboard');
});
