<!DOCTYPE html>

<html class="dark" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Update Employee | Luminous Executive</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200;400;500;600;700;800&amp;family=Inter:wght@300;400;500;600&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "surface-container-lowest": "#000000",
                        "on-primary-fixed": "#003f43",
                        "secondary": "#ac89ff",
                        "secondary-fixed-dim": "#ceb9ff",
                        "on-secondary": "#290067",
                        "surface-dim": "#0b0e14",
                        "on-primary-container": "#005359",
                        "surface-container-low": "#10131a",
                        "tertiary-dim": "#00e9bf",
                        "on-surface-variant": "#a9abb3",
                        "on-primary": "#005d63",
                        "on-tertiary-container": "#005d4b",
                        "background": "#0b0e14",
                        "primary": "#8ff5ff",
                        "tertiary": "#b9ffe8",
                        "secondary-container": "#7000ff",
                        "on-tertiary-fixed": "#00483a",
                        "primary-fixed-dim": "#00deec",
                        "on-surface": "#ecedf6",
                        "surface-bright": "#282c36",
                        "on-background": "#ecedf6",
                        "surface-container": "#161a21",
                        "tertiary-container": "#15ffd1",
                        "on-error-container": "#ffa8a3",
                        "on-secondary-container": "#f8f1ff",
                        "on-secondary-fixed": "#41009a",
                        "outline-variant": "#45484f",
                        "on-tertiary": "#006653",
                        "surface-container-high": "#1c2028",
                        "inverse-on-surface": "#52555c",
                        "inverse-surface": "#f9f9ff",
                        "primary-container": "#00eefc",
                        "on-secondary-fixed-variant": "#6300e2",
                        "error": "#ff716c",
                        "on-error": "#490006",
                        "surface-tint": "#8ff5ff",
                        "on-primary-fixed-variant": "#005e64",
                        "on-tertiary-fixed-variant": "#006854",
                        "tertiary-fixed-dim": "#00efc4",
                        "surface-container-highest": "#22262f",
                        "tertiary-fixed": "#15ffd1",
                        "error-dim": "#d7383b",
                        "primary-fixed": "#00eefc",
                        "outline": "#73757d",
                        "error-container": "#9f0519",
                        "inverse-primary": "#006a71",
                        "surface-variant": "#22262f",
                        "primary-dim": "#00deec",
                        "surface": "#0b0e14",
                        "secondary-dim": "#874cff",
                        "secondary-fixed": "#dac9ff"
                    },
                    fontFamily: {
                        "headline": ["Manrope"],
                        "body": ["Inter"],
                        "label": ["Inter"]
                    },
                    borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "1.5rem", "full": "9999px"},
                },
            },
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            display: inline-block;
            line-height: 1;
        }
        .glass-card {
            background: rgba(34, 38, 47, 0.4);
            backdrop-filter: blur(24px);
            border: 1px solid rgba(255, 255, 255, 0.05);
        }
        .prism-border {
            position: relative;
        }
        .prism-border::before {
            content: "";
            position: absolute;
            inset: 0;
            border-radius: 1.5rem;
            padding: 1px;
            background: linear-gradient(to bottom right, rgba(143, 245, 255, 0.3), rgba(172, 137, 255, 0.1));
            mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
            -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
            pointer-events: none;
        }
        .custom-scrollbar::-webkit-scrollbar {
            width: 6px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: transparent;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: rgba(143, 245, 255, 0.1);
            border-radius: 10px;
        }
    </style>
</head>
<body class="bg-background text-on-surface font-body selection:bg-primary/30 min-h-screen flex overflow-hidden">
<!-- SideNavBar -->
<aside class="h-screen w-72 hidden md:flex flex-col sticky top-0 left-0 bg-slate-900/60 backdrop-blur-xl flex-shrink-0 border-r border-white/5 shadow-[20px_0_50px_rgba(0,0,0,0.3)] z-50">
<div class="p-8">
<div class="flex items-center gap-3 mb-10">
<div class="w-10 h-10 rounded-xl bg-gradient-to-br from-cyan-400 to-purple-400 flex items-center justify-center shadow-lg shadow-cyan-500/20">
<span class="material-symbols-outlined text-slate-900 font-bold" data-icon="lightbulb">lightbulb</span>
</div>
<div>
<h1 class="text-2xl font-black tracking-tighter text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-purple-400 font-headline">Luminous</h1>
<p class="text-[10px] uppercase tracking-[0.2em] text-on-surface-variant font-bold">Executive Suite</p>
</div>
</div>
<nav class="space-y-2">
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors hover:bg-slate-700/30 hover:backdrop-blur-md rounded-xl font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
                    Dashboard
                </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors hover:bg-slate-700/30 hover:backdrop-blur-md rounded-xl font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="group">group</span>
                    Employees
                </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors hover:bg-slate-700/30 hover:backdrop-blur-md rounded-xl font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="person_add">person_add</span>
                    Add Employee
                </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors hover:bg-slate-700/30 hover:backdrop-blur-md rounded-xl font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="person_remove">person_remove</span>
                    Delete Employee
                </a>
<a class="flex items-center gap-3 px-4 py-3 text-cyan-400 border-l-2 border-cyan-400 bg-cyan-400/10 transition-all duration-300 rounded-r-xl font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="person_edit" style="font-variation-settings: 'FILL' 1;">person_edit</span>
                    Update Employee
                </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors hover:bg-slate-700/30 hover:backdrop-blur-md rounded-xl font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="search">search</span>
                    Search
                </a>
</nav>
</div>
<div class="mt-auto p-8 border-t border-white/5 bg-slate-800/20">
<div class="space-y-2 mb-6">
<a class="flex items-center gap-3 px-4 py-2 text-slate-400 hover:text-slate-200 transition-colors font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="settings">settings</span>
                    Settings
                </a>
<a class="flex items-center gap-3 px-4 py-2 text-slate-400 hover:text-slate-200 transition-colors font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="logout">logout</span>
                    Logout
                </a>
</div>
<button class="w-full py-4 rounded-xl bg-gradient-to-r from-primary to-secondary text-surface-container-lowest font-bold text-sm hover:scale-[1.02] transition-transform">
                Support
            </button>
</div>
</aside>
<!-- Main Canvas -->
<main class="flex-1 flex flex-col h-screen overflow-hidden">
<!-- TopNavBar -->
<header class="flex justify-between items-center w-full px-8 py-4 h-20 sticky top-0 bg-slate-950/40 backdrop-blur-md z-40 border-b border-white/5">
<div class="flex items-center gap-4">
<span class="text-xl font-bold text-slate-100 font-headline">Luminous Executive</span>
<span class="px-2 py-0.5 rounded text-[10px] font-bold bg-primary/10 text-primary border border-primary/20">PRO</span>
</div>
<div class="flex items-center gap-6">
<div class="flex items-center gap-4 border-r border-white/10 pr-6">
<button class="text-slate-400 hover:text-cyan-300 transition-colors">
<span class="material-symbols-outlined" data-icon="notifications">notifications</span>
</button>
<button class="text-slate-400 hover:text-cyan-300 transition-colors">
<span class="material-symbols-outlined" data-icon="dark_mode" style="font-variation-settings: 'FILL' 1;">dark_mode</span>
</button>
</div>
<div class="flex items-center gap-3 cursor-pointer group">
<div class="text-right">
<p class="text-sm font-semibold text-on-surface">Alex Sterling</p>
<p class="text-[10px] text-on-surface-variant font-medium">Chief Administrator</p>
</div>
<div class="w-10 h-10 rounded-full border-2 border-cyan-400/30 overflow-hidden group-hover:border-cyan-400 transition-all">
<img alt="User Profile" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCe7POJMpFbtE00J-rigLWhKtcUX8ox-O0EHhxoKr1ImA4jSFgQ6ze5BIWHRxQBt8aZ1apUqJo8iGrp8ht6q8A3slZRxepxuP9RC2I7mu-Ze5xnBz-6hIWTEXl_iBGn4wciOOCM_XWzLrVpUuGvtjwmBaEs5GSc9LVwWGitHtOQ6gVkoRg_T7G5Z6Bf_pzHbW7amNDXFx9ODE7xa3vabpeg1NjzsF4ldxT0y3GjUvt5Skg5jtjtK-ESteQ3vzC5t7uZ4IQ2s44SOuU"/>
</div>
</div>
</div>
</header>
<!-- Content Area -->
<section class="flex-1 overflow-y-auto p-8 lg:p-12 custom-scrollbar">
<div class="max-w-4xl mx-auto space-y-8">
<!-- Page Header -->
<div>
<h2 class="text-4xl font-headline font-extrabold tracking-tight text-on-surface">Update Employee</h2>
<p class="text-on-surface-variant mt-2">Modify account details and workspace permissions for team members.</p>
</div>
<!-- Main Form Panel -->
<div class="glass-card rounded-[1.5rem] prism-border overflow-hidden">
<div class="p-8 space-y-8">
<!-- Profile Header Section -->
<div class="flex flex-col md:flex-row items-center gap-6 p-6 rounded-2xl bg-surface-container-low/50">
<div class="relative">
<img alt="Employee Photo" class="w-24 h-24 rounded-2xl object-cover ring-4 ring-primary/10 shadow-2xl shadow-primary/20" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAwtxU8_Ucg9KWlCFhs8qdnegpTalxyMBHX_KQaURaahs2bOiFfE_giqJy8WLZDILtiKqKRT9PPGTnqUEcT1Pjzofm1RBKTAhK44nEYT2olnr1UMNPPWC-WoRXOcwgiCtOgcxhEhtNZlf-4vzHkQHygWSWbqVoe74QLAEbxurto7r2tf0UMQz3CsWm8jKJCDMeeVj3a8zxUGK1O86hXpqoeM_jTQvnnoOq0M2lI3M8KAi8Fl-mjJAKB0e1Resbw0umKFSfWaMrHTBQ"/>
<button class="absolute -bottom-2 -right-2 bg-primary text-on-primary p-2 rounded-xl shadow-lg hover:scale-110 active:scale-95 transition-all">
<span class="material-symbols-outlined !text-lg">edit</span>
</button>
</div>
<div class="text-center md:text-left">
<h3 class="font-headline text-2xl font-bold">Helena Vance</h3>
<p class="text-xs font-label uppercase tracking-[0.2em] text-primary font-bold mt-1">Senior Design Lead</p>
<div class="mt-4 flex items-center gap-2 px-3 py-1 rounded-full bg-tertiary/10 text-tertiary text-[10px] font-bold w-fit mx-auto md:mx-0">
<span class="w-1.5 h-1.5 rounded-full bg-tertiary"></span>
                                    ACCOUNT ACTIVE
                                </div>
</div>
</div>
<!-- Form Fields Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">
<div class="space-y-2">
<label class="text-xs font-bold text-on-surface-variant uppercase tracking-widest px-1">Full Name</label>
<input class="w-full bg-surface-container border border-white/5 rounded-xl px-4 py-3 focus:ring-2 focus:ring-primary/40 focus:border-primary/40 text-on-surface transition-all outline-none" type="text" value="Helena Vance"/>
</div>
<div class="space-y-2">
<label class="text-xs font-bold text-on-surface-variant uppercase tracking-widest px-1">Corporate Email</label>
<input class="w-full bg-surface-container border border-white/5 rounded-xl px-4 py-3 focus:ring-2 focus:ring-primary/40 focus:border-primary/40 text-on-surface transition-all outline-none" type="email" value="h.vance@luminaprism.com"/>
</div>
<div class="space-y-2">
<label class="text-xs font-bold text-on-surface-variant uppercase tracking-widest px-1">Phone Number</label>
<input class="w-full bg-surface-container border border-white/5 rounded-xl px-4 py-3 focus:ring-2 focus:ring-primary/40 focus:border-primary/40 text-on-surface transition-all outline-none" type="tel" value="+1 (555) 902-4412"/>
</div>
<div class="space-y-2">
<label class="text-xs font-bold text-on-surface-variant uppercase tracking-widest px-1">Department</label>
<div class="relative">
<select class="w-full appearance-none bg-surface-container border border-white/5 rounded-xl px-4 py-3 focus:ring-2 focus:ring-primary/40 focus:border-primary/40 text-on-surface transition-all outline-none">
<option>Product &amp; Design</option>
<option>Engineering</option>
<option>Marketing</option>
<option>Human Resources</option>
</select>
<span class="material-symbols-outlined absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-on-surface-variant">expand_more</span>
</div>
</div>
<div class="space-y-2">
<label class="text-xs font-bold text-on-surface-variant uppercase tracking-widest px-1">Current Role</label>
<input class="w-full bg-surface-container border border-white/5 rounded-xl px-4 py-3 focus:ring-2 focus:ring-primary/40 focus:border-primary/40 text-on-surface transition-all outline-none" type="text" value="Senior Design Lead"/>
</div>
<div class="space-y-2">
<label class="text-xs font-bold text-on-surface-variant uppercase tracking-widest px-1">Annual Salary (USD)</label>
<div class="relative">
<span class="absolute left-4 top-1/2 -translate-y-1/2 text-on-surface-variant font-medium">$</span>
<input class="w-full bg-surface-container border border-white/5 rounded-xl pl-10 pr-4 py-3 focus:ring-2 focus:ring-primary/40 focus:border-primary/40 text-on-surface transition-all outline-none" type="text" value="145,000"/>
</div>
</div>
</div>
<!-- Danger Zone / Status Action -->
<div class="p-6 rounded-2xl bg-error/5 border border-error/10 space-y-4">
<div class="flex items-center justify-between">
<div>
<h4 class="font-bold text-on-surface">Account Access</h4>
<p class="text-sm text-on-surface-variant">Active since March 2022</p>
</div>
<button class="px-5 py-2.5 rounded-xl text-error bg-error/10 hover:bg-error/20 border border-error/20 transition-all font-semibold text-sm">
                                    Revoke Access
                                </button>
</div>
<p class="text-xs text-on-surface-variant">Warning: Revoking access will immediately disable all corporate credentials and SSO entry for this user.</p>
</div>
</div>
<!-- Footer Actions -->
<div class="p-8 bg-surface-container-high/40 flex flex-col sm:flex-row justify-end gap-4 border-t border-white/5">
<button class="px-8 py-3 rounded-xl font-semibold text-on-surface-variant hover:text-on-surface hover:bg-white/5 transition-all text-sm">
                            Discard Changes
                        </button>
<button class="px-10 py-3 rounded-xl font-bold bg-gradient-to-r from-primary to-secondary text-on-secondary shadow-lg shadow-primary/20 hover:scale-[1.02] active:scale-[0.98] transition-all text-sm">
                            Update Profile
                        </button>
</div>
</div>
<div class="h-20"></div> <!-- Spacer for scrolling -->
</div>
</section>
</main>
<!-- BottomNavBar for Mobile -->
<nav class="md:hidden fixed bottom-0 left-0 right-0 h-16 bg-slate-900/80 backdrop-blur-xl flex items-center justify-around px-6 border-t border-white/5 z-50">
<button class="flex flex-col items-center gap-1 text-slate-400">
<span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
</button>
<button class="flex flex-col items-center gap-1 text-slate-400">
<span class="material-symbols-outlined" data-icon="group">group</span>
</button>
<button class="flex flex-col items-center gap-1 text-cyan-400">
<span class="material-symbols-outlined" data-icon="person_edit" style="font-variation-settings: 'FILL' 1;">person_edit</span>
</button>
<button class="flex flex-col items-center gap-1 text-slate-400">
<span class="material-symbols-outlined" data-icon="settings">settings</span>
</button>
</nav>
</body></html>