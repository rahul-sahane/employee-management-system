<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="dark" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Employees | Luminous Executive</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200;400;500;600;700;800&amp;family=Inter:wght@300;400;500;600&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
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
            background: rgba(34, 38, 47, 0.6);
            backdrop-filter: blur(20px);
        }
        .tonal-shift {
            background-color: rgba(16, 19, 26, 0.4);
        }
    </style>
</head>
<body class="bg-background text-on-surface font-body selection:bg-primary/30 min-h-screen flex overflow-hidden">
<!-- SideNavBar (Shared Component) -->
<aside class="h-screen w-72 hidden md:flex flex-col sticky top-0 left-0 bg-slate-900/60 backdrop-blur-xl flex-shrink-0 border-r border-white/5 shadow-[20px_0_50px_rgba(0,0,0,0.3)] z-50">
<div class="p-8">
<div class="flex items-center gap-3 mb-12">
<div class="w-10 h-10 rounded-xl bg-gradient-to-br from-cyan-400 to-purple-400 flex items-center justify-center">
<span class="material-symbols-outlined text-slate-900 font-bold" data-icon="lightbulb">lightbulb</span>
</div>
<div>
<h1 class="text-2xl font-black tracking-tighter text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-purple-400">Luminous</h1>
<p class="text-[10px] uppercase tracking-[0.2em] text-slate-500 font-bold">Executive Suite</p>
</div>
</div>
<nav class="space-y-2">
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors font-manrope text-sm font-medium tracking-wide hover:bg-slate-700/30 hover:backdrop-blur-md rounded-xl" href="#">
<span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
                    Dashboard
                </a>
<a class="flex items-center gap-3 px-4 py-3 text-cyan-400 border-l-2 border-cyan-400 bg-cyan-400/10 transition-all duration-300 font-manrope text-sm font-medium tracking-wide rounded-r-xl" href="#">
<span class="material-symbols-outlined" data-icon="group" style="font-variation-settings: 'FILL' 1;">group</span>
                    Employees
                </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors font-manrope text-sm font-medium tracking-wide hover:bg-slate-700/30 hover:backdrop-blur-md rounded-xl" href="#">
<span class="material-symbols-outlined" data-icon="person_add">person_add</span>
                    Add Employee
                </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors font-manrope text-sm font-medium tracking-wide hover:bg-slate-700/30 hover:backdrop-blur-md rounded-xl" href="#">
<span class="material-symbols-outlined" data-icon="search">search</span>
                    Search
                </a>
</nav>
</div>
<div class="mt-auto p-8 space-y-2">
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors font-manrope text-sm font-medium tracking-wide hover:bg-slate-700/30 hover:backdrop-blur-md rounded-xl" href="#">
<span class="material-symbols-outlined" data-icon="settings">settings</span>
                Settings
            </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors font-manrope text-sm font-medium tracking-wide hover:bg-slate-700/30 hover:backdrop-blur-md rounded-xl" href="#">
<span class="material-symbols-outlined" data-icon="logout">logout</span>
                Logout
            </a>
<div class="pt-6">
<button class="w-full py-4 rounded-xl bg-gradient-to-r from-primary to-secondary text-surface-container-lowest font-bold text-sm hover:scale-[1.02] transition-transform">
                    Support
                </button>
</div>
</div>
</aside>
<main class="flex-1 flex flex-col h-screen overflow-hidden">
<!-- TopNavBar (Shared Component) -->
<header class="flex justify-between items-center w-full px-8 py-4 h-20 sticky top-0 bg-slate-950/40 backdrop-blur-md z-40">
<div class="flex items-center gap-8">
<span class="text-xl font-bold text-slate-100 font-headline">Luminous Executive</span>
<!-- Custom Search Bar implementation for this view -->
<div class="hidden lg:flex items-center bg-surface-container-low px-4 py-2 rounded-xl border border-white/5 w-96 group focus-within:border-primary/50 transition-all">
<span class="material-symbols-outlined text-slate-500 group-focus-within:text-primary transition-colors" data-icon="search">search</span>
<input class="bg-transparent border-none focus:ring-0 text-sm w-full text-on-surface placeholder:text-slate-600" placeholder="Search employees by name, role or ID..." type="text"/>
</div>
</div>
<div class="flex items-center gap-6">
<div class="flex items-center gap-4 text-slate-400">
<button class="hover:text-cyan-300 transition-colors">
<span class="material-symbols-outlined" data-icon="notifications">notifications</span>
</button>
<button class="hover:text-cyan-300 transition-colors">
<span class="material-symbols-outlined" data-icon="dark_mode">dark_mode</span>
</button>
</div>
<div class="h-10 w-10 rounded-full border-2 border-primary/20 overflow-hidden cursor-pointer">
<img class="w-full h-full object-cover" data-alt="Close up portrait of a senior executive male with grey hair smiling in professional studio lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCx7y0shwLKIx-FtwZPpMNlzze-OfB6AlW7KWJkT3QScGixESuJSdam7oFdTN6nsQkCwW0C5CnvobCSB1OlehtVO7DgvELKFY1dTTL54X7_C4fFE66aHkcuy9DAT5oe-UQhywHR2GUVFwpcPAWlGbAg7s66XAC6eHHhjTQuGngOBqmWLdbip-IbTWpRRonHQNp78Han7U-keyHhfFKdz4Y_QJtuhcClexovhm7Tr3YJTSlRxk8SsFxCJsy47dnj9WW7K_hXKpS108Y"/>
</div>
</div>
</header>
<!-- Content Canvas -->
<section class="flex-1 overflow-y-auto p-8 space-y-10 custom-scrollbar">
<!-- Page Header -->
<div class="flex flex-col md:flex-row md:items-end justify-between gap-4">
<div>
<h2 class="text-4xl font-headline font-extrabold tracking-tight text-on-surface">Employee Directory</h2>
<p class="text-on-surface-variant mt-2 max-w-xl">Manage your global workforce with precision. View performance metrics, edit roles, and oversee departmental distributions from a single pane of glass.</p>
</div>
<div class="flex gap-3">
<button class="px-6 py-3 rounded-xl bg-surface-variant/40 backdrop-blur-md text-on-surface font-semibold text-sm hover:bg-surface-variant/60 transition-all flex items-center gap-2">
<span class="material-symbols-outlined text-[20px]" data-icon="filter_list">filter_list</span>
                        Filters
                    </button>
<button class="px-6 py-3 rounded-xl bg-gradient-to-r from-primary to-secondary text-surface-container-lowest font-bold text-sm hover:scale-[1.02] transition-transform flex items-center gap-2">
<span class="material-symbols-outlined text-[20px]" data-icon="add_circle">add_circle</span>
                        Add Employee
                    </button>
</div>
</div>
<!-- Stats Bar (Prism Cards) -->
<div class="grid grid-cols-1 md:grid-cols-4 gap-6">
<div class="glass-card rounded-xl p-6 relative overflow-hidden group">
<div class="absolute left-0 top-0 bottom-0 w-[2px] bg-tertiary"></div>
<p class="text-on-surface-variant text-xs font-bold uppercase tracking-widest">Total Staff</p>
<div class="flex items-baseline gap-2 mt-2">
<h3 class="text-3xl font-headline font-bold">1,284</h3>
<span class="text-tertiary text-xs font-medium flex items-center">+4.2%</span>
</div>
</div>
<div class="glass-card rounded-xl p-6 relative overflow-hidden group">
<div class="absolute left-0 top-0 bottom-0 w-[2px] bg-primary"></div>
<p class="text-on-surface-variant text-xs font-bold uppercase tracking-widest">Active Now</p>
<div class="flex items-baseline gap-2 mt-2">
<h3 class="text-3xl font-headline font-bold">942</h3>
<span class="text-primary-container text-xs font-medium bg-primary-container/10 px-2 py-0.5 rounded-full">Live</span>
</div>
</div>
<div class="glass-card rounded-xl p-6 relative overflow-hidden group">
<div class="absolute left-0 top-0 bottom-0 w-[2px] bg-secondary"></div>
<p class="text-on-surface-variant text-xs font-bold uppercase tracking-widest">Avg Retention</p>
<div class="flex items-baseline gap-2 mt-2">
<h3 class="text-3xl font-headline font-bold">4.2 yrs</h3>
<span class="text-secondary-fixed-dim text-xs font-medium">+0.8</span>
</div>
</div>
<div class="glass-card rounded-xl p-6 relative overflow-hidden group">
<div class="absolute left-0 top-0 bottom-0 w-[2px] bg-error"></div>
<p class="text-on-surface-variant text-xs font-bold uppercase tracking-widest">Vacancies</p>
<div class="flex items-baseline gap-2 mt-2">
<h3 class="text-3xl font-headline font-bold">12</h3>
<span class="text-on-surface-variant text-xs font-medium">Hiring</span>
</div>
</div>
</div>
<!-- Employee List (The "Fluid" List) -->
<div class="bg-surface-container-low rounded-xl overflow-hidden shadow-2xl">
<div class="overflow-x-auto">
<table class="w-full text-left border-collapse">
<thead>
<tr class="bg-surface-container-high/50 sticky top-0 z-10">
<th class="px-8 py-5 font-manrope font-bold text-xs uppercase tracking-widest text-on-surface-variant border-none">ID</th>
<th class="px-8 py-5 font-manrope font-bold text-xs uppercase tracking-widest text-on-surface-variant border-none">Name</th>
<th class="px-8 py-5 font-manrope font-bold text-xs uppercase tracking-widest text-on-surface-variant border-none">Department</th>
<th class="px-8 py-5 font-manrope font-bold text-xs uppercase tracking-widest text-on-surface-variant border-none">Role</th>
<th class="px-8 py-5 font-manrope font-bold text-xs uppercase tracking-widest text-on-surface-variant border-none">Salary</th>
<th class="px-8 py-5 font-manrope font-bold text-xs uppercase tracking-widest text-on-surface-variant border-none text-right">Actions</th>
</tr>
</thead>
<tbody class="divide-y divide-white/[0.03]">
<!-- Row 1 -->
<tr class="group hover:bg-surface-container transition-all duration-300">
<td class="px-8 py-6 text-sm font-mono text-primary/70">#LX-9021</td>
<td class="px-8 py-6">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-full overflow-hidden bg-surface-container-highest">
<img class="w-full h-full object-cover" data-alt="Close up portrait of a young professional woman with brown hair and friendly smile in bright natural daylight" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBPVaNNW-h_rZA3VFhnFjxgHa5OL_9F-6v5TmRBmQoLHEYEZlBLggO36rM2HqFgTn9gfMOaUbvyzgXEkrUbyKLR9Ehllq8AzGSzr-uqFv37juJe-TEqbmEjizLqa8TXvb8SdxZlzt3GMYisEQ7O4hME2BTKkNBE1O4n1bvvt4mNAJqy0iDJGdurMDNFQfOniXgVoMvG-hLUpfh3jFwssl1yTuA0xu_B2ohCmkWm0v851RL96XyzsUX0JtJ8w94WOCjjKp6uHAWvrQw"/>
</div>
<div>
<div class="font-semibold text-on-surface">Elena Rodriguez</div>
<div class="text-xs text-on-surface-variant">elena.r@luminous.com</div>
</div>
</div>
</td>
<td class="px-8 py-6">
<span class="px-3 py-1 rounded-full bg-primary/10 text-primary text-[10px] font-bold uppercase tracking-wider">Product Design</span>
</td>
<td class="px-8 py-6 text-sm text-on-surface-variant">Senior Lead Designer</td>
<td class="px-8 py-6 text-sm font-semibold text-on-surface">$142,500</td>
<td class="px-8 py-6 text-right">
<div class="flex justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
<button class="p-2 rounded-lg bg-surface-container-highest hover:text-primary transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="edit">edit</span>
</button>
<button class="p-2 rounded-lg bg-surface-container-highest hover:text-error transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="delete">delete</span>
</button>
</div>
</td>
</tr>
<!-- Row 2 -->
<tr class="group hover:bg-surface-container transition-all duration-300">
<td class="px-8 py-6 text-sm font-mono text-primary/70">#LX-8832</td>
<td class="px-8 py-6">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-full overflow-hidden bg-surface-container-highest">
<img class="w-full h-full object-cover" data-alt="Portrait of a young middle eastern man with short beard wearing glasses looking thoughtful in soft indoor light" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDO0G87fLIQLQrKRQ8WrulbSNvRlsf_LsKnyApUhV7ahkgIISLgyXcreLRO9FEkdxmxh10SMM54SBxDmdrxbgdGG3DccAIsP--VRjNWrcUeouFMht1pIAUdjmoot1Al1VN6HrspFuEIEdI2wx_b7Qnjarz1Ld3q_W5PY0KGEvaH7jB9A_hBrtCCQpWdRUpGSoZ8zsR9uqmw0mqDJjwKSU-D2RPmJ2UosVaJT2Ye1efg2wAhYd-ahHuwZHezV8iPlHQaYc14n72MJOM"/>
</div>
<div>
<div class="font-semibold text-on-surface">Amir Al-Farsi</div>
<div class="text-xs text-on-surface-variant">a.alfarsi@luminous.com</div>
</div>
</div>
</td>
<td class="px-8 py-6">
<span class="px-3 py-1 rounded-full bg-secondary/10 text-secondary text-[10px] font-bold uppercase tracking-wider">Engineering</span>
</td>
<td class="px-8 py-6 text-sm text-on-surface-variant">Cloud Architect</td>
<td class="px-8 py-6 text-sm font-semibold text-on-surface">$168,000</td>
<td class="px-8 py-6 text-right">
<div class="flex justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
<button class="p-2 rounded-lg bg-surface-container-highest hover:text-primary transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="edit">edit</span>
</button>
<button class="p-2 rounded-lg bg-surface-container-highest hover:text-error transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="delete">delete</span>
</button>
</div>
</td>
</tr>
<!-- Row 3 -->
<tr class="group hover:bg-surface-container transition-all duration-300">
<td class="px-8 py-6 text-sm font-mono text-primary/70">#LX-7721</td>
<td class="px-8 py-6">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-full overflow-hidden bg-surface-container-highest">
<img class="w-full h-full object-cover" data-alt="Stylish woman with long dark hair wearing a minimalist blazer against a clean architectural background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDg2VxF5hb7MKX0yXCriK_gT2z38QW7XcQfSgRpPHsr9lHcU5h4GSgoOM_qzDEYFhdu_XhazweJTcHehF8LRm9_V6tpkxNZqIGmZnHdR72t0yvF8ITj9c7A5fmQ-r4KSK9sT-avGKVaB9FU8Owae8kIt_JVT67BW1RukKROqrSO7aum2_bEoixEPuiIa2EASs8BCwijlSB3gciHuZnCwwv0myCwZjfWABjgN4fSyZy0yqiTCguopTCkWtSfPKhIr0PxvjQZvvZQC_w"/>
</div>
<div>
<div class="font-semibold text-on-surface">Sarah Chen</div>
<div class="text-xs text-on-surface-variant">s.chen@luminous.com</div>
</div>
</div>
</td>
<td class="px-8 py-6">
<span class="px-3 py-1 rounded-full bg-tertiary/10 text-tertiary text-[10px] font-bold uppercase tracking-wider">Strategy</span>
</td>
<td class="px-8 py-6 text-sm text-on-surface-variant">VP Growth</td>
<td class="px-8 py-6 text-sm font-semibold text-on-surface">$210,000</td>
<td class="px-8 py-6 text-right">
<div class="flex justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
<button class="p-2 rounded-lg bg-surface-container-highest hover:text-primary transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="edit">edit</span>
</button>
<button class="p-2 rounded-lg bg-surface-container-highest hover:text-error transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="delete">delete</span>
</button>
</div>
</td>
</tr>
<!-- Row 4 -->
<tr class="group hover:bg-surface-container transition-all duration-300">
<td class="px-8 py-6 text-sm font-mono text-primary/70">#LX-6651</td>
<td class="px-8 py-6">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-full overflow-hidden bg-surface-container-highest">
<img class="w-full h-full object-cover" data-alt="Portrait of a creative looking man with messy blonde hair and beard in an urban studio setting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA_JnnS53O9LP2m1s592_vGm3fzPK8aDlrtIuUfAhbuOkuCY-H-2ex1b-QujJS24lspXl18_Kary7l0cenoKGrlK1DWCxEqLI5HW0W5xbrtZfZAseyjP5OynT4yJICZ9jATlkKTnVjNEwDHzbCtrZ011m4cqW4A2UNkMb5fBy7FWQ0Ticq_kBmPUELGGOTUCKW7g5f-pgo0czWPFB1I8E_LUGyL8qcaE7CQjANDjFKRRTR-LEM1BL4NZiMEQMLztB5ZVhpSGat9juw"/>
</div>
<div>
<div class="font-semibold text-on-surface">Jameson Brooks</div>
<div class="text-xs text-on-surface-variant">j.brooks@luminous.com</div>
</div>
</div>
</td>
<td class="px-8 py-6">
<span class="px-3 py-1 rounded-full bg-primary/10 text-primary text-[10px] font-bold uppercase tracking-wider">Marketing</span>
</td>
<td class="px-8 py-6 text-sm text-on-surface-variant">Content Strategist</td>
<td class="px-8 py-6 text-sm font-semibold text-on-surface">$115,000</td>
<td class="px-8 py-6 text-right">
<div class="flex justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
<button class="p-2 rounded-lg bg-surface-container-highest hover:text-primary transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="edit">edit</span>
</button>
<button class="p-2 rounded-lg bg-surface-container-highest hover:text-error transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="delete">delete</span>
</button>
</div>
</td>
</tr>
<!-- Row 5 -->
<tr class="group hover:bg-surface-container transition-all duration-300">
<td class="px-8 py-6 text-sm font-mono text-primary/70">#LX-4410</td>
<td class="px-8 py-6">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-full overflow-hidden bg-surface-container-highest">
<img class="w-full h-full object-cover" data-alt="Headshot of a focused woman professional with short dark hair in a crisp white shirt with neutral lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCC_G6Z8Fg4FFwePK6YuiqIGdpwX4ck9nWLjDxbWZZwTydRlR0IU_lBUW6L_Vnurl6JT_waxCEkUorEGMf1wQx-NYcfII1zI5msGSScXAPphEpCRUbwV4qOfU3Mw2Ne4kiZttr-b9EP5qjRkecThyW85wz4MFv96oKKqqNvxL-k2UXFJIgdpZbDcXf80E45Oqs9_eV4fUo73ChDEtzinIsGiPREt-I3VxfvFkkpZ2IQ8rvCsWVGRG2LZ_UZAdKQLk-hoH1wsbHsMz4"/>
</div>
<div>
<div class="font-semibold text-on-surface">Linda Kaworski</div>
<div class="text-xs text-on-surface-variant">l.kaworski@luminous.com</div>
</div>
</div>
</td>
<td class="px-8 py-6">
<span class="px-3 py-1 rounded-full bg-secondary/10 text-secondary text-[10px] font-bold uppercase tracking-wider">Operations</span>
</td>
<td class="px-8 py-6 text-sm text-on-surface-variant">Director of Logistics</td>
<td class="px-8 py-6 text-sm font-semibold text-on-surface">$185,000</td>
<td class="px-8 py-6 text-right">
<div class="flex justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
<button class="p-2 rounded-lg bg-surface-container-highest hover:text-primary transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="edit">edit</span>
</button>
<button class="p-2 rounded-lg bg-surface-container-highest hover:text-error transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="delete">delete</span>
</button>
</div>
</td>
</tr>
</tbody>
</table>
</div>
<!-- Pagination / Footer -->
<div class="px-8 py-4 bg-surface-container-low border-t border-white/[0.03] flex items-center justify-between">
<p class="text-xs text-on-surface-variant">Showing <span class="text-on-surface font-semibold">1-5</span> of <span class="text-on-surface font-semibold">1,284</span> employees</p>
<div class="flex gap-2">
<button class="p-2 rounded-lg hover:bg-surface-container-highest text-on-surface-variant transition-colors disabled:opacity-30" disabled="">
<span class="material-symbols-outlined text-[20px]" data-icon="chevron_left">chevron_left</span>
</button>
<button class="w-8 h-8 rounded-lg bg-primary/20 text-primary text-xs font-bold">1</button>
<button class="w-8 h-8 rounded-lg hover:bg-surface-container-highest text-on-surface-variant text-xs font-bold transition-colors">2</button>
<button class="w-8 h-8 rounded-lg hover:bg-surface-container-highest text-on-surface-variant text-xs font-bold transition-colors">3</button>
<span class="px-2 text-on-surface-variant">...</span>
<button class="w-8 h-8 rounded-lg hover:bg-surface-container-highest text-on-surface-variant text-xs font-bold transition-colors">257</button>
<button class="p-2 rounded-lg hover:bg-surface-container-highest text-on-surface-variant transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="chevron_right">chevron_right</span>
</button>
</div>
</div>
</div>
<!-- Empty space for scroll breathing -->
<div class="h-12"></div>
</section>
</main>
<!-- BottomNavBar for Mobile -->
<nav class="md:hidden fixed bottom-0 left-0 right-0 h-16 bg-slate-900/80 backdrop-blur-xl flex items-center justify-around px-6 border-t border-white/5 z-50">
<button class="flex flex-col items-center gap-1 text-slate-400">
<span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
</button>
<button class="flex flex-col items-center gap-1 text-cyan-400">
<span class="material-symbols-outlined" data-icon="group" style="font-variation-settings: 'FILL' 1;">group</span>
</button>
<button class="flex flex-col items-center gap-1 text-slate-400">
<span class="material-symbols-outlined" data-icon="person_add">person_add</span>
</button>
<button class="flex flex-col items-center gap-1 text-slate-400">
<span class="material-symbols-outlined" data-icon="settings">settings</span>
</button>
</nav>
</body></html>