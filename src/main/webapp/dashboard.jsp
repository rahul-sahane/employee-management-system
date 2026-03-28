<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="dark" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Luminous Executive | Employee Management</title>
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
        }
        .glass-card {
            background: rgba(34, 38, 47, 0.6);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.05);
        }
        .tonal-shift {
            background: linear-gradient(180deg, rgba(16, 19, 26, 0.8) 0%, rgba(11, 14, 20, 1) 100%);
        }
    </style>
</head>
<body class="bg-background text-on-surface font-body selection:bg-primary/30">
<div class="flex min-h-screen">
<!-- SideNavBar -->
<aside class="h-screen w-72 hidden md:flex flex-col sticky top-0 left-0 bg-slate-900/60 backdrop-blur-xl flex-shrink-0 border-r border-white/5 shadow-[20px_0_50px_rgba(0,0,0,0.3)] z-50">
<div class="p-8">
<div class="flex items-center gap-3 mb-10">
<div class="w-10 h-10 rounded-xl bg-gradient-to-br from-cyan-400 to-purple-400 flex items-center justify-center shadow-lg shadow-cyan-500/20">
<span class="material-symbols-outlined text-surface-container-lowest" style="font-variation-settings: 'FILL' 1;">diamond</span>
</div>
<div>
<h1 class="text-2xl font-black tracking-tighter text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-purple-400 font-headline">Luminous</h1>
<p class="text-[10px] uppercase tracking-[0.2em] text-on-surface-variant font-bold">Executive Suite</p>
</div>
</div>
<nav class="space-y-2">
<a class="flex items-center gap-3 px-4 py-3 text-cyan-400 border-l-2 border-cyan-400 bg-cyan-400/10 transition-all duration-300 font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="dashboard"> dashboard </span>
                        Dashboard
                    </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors hover:bg-slate-700/30 hover:backdrop-blur-md font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="group">group</span>
                        Employees
                    </a>
<a href="addemployee.jsp" class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors hover:bg-slate-700/30 hover:backdrop-blur-md font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="person_add">person_add</span>
                        Add Employee
                    </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors hover:bg-slate-700/30 hover:backdrop-blur-md font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="person_remove">person_remove</span>
                        Delete Employee
                    </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors hover:bg-slate-700/30 hover:backdrop-blur-md font-manrope text-sm font-medium tracking-wide" href="#">
<span class="material-symbols-outlined" data-icon="person_edit">person_edit</span>
                        Update Employee
                    </a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-400 hover:text-slate-200 transition-colors hover:bg-slate-700/30 hover:backdrop-blur-md font-manrope text-sm font-medium tracking-wide" href="#">
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
<button class="w-full py-3 rounded-xl bg-surface-variant/40 border border-white/10 text-cyan-400 font-semibold text-sm hover:bg-cyan-400/10 transition-all duration-300">
                    Support
                </button>
</div>
</aside>
<!-- Main Canvas -->
<main class="flex-1 flex flex-col min-w-0 bg-surface">
<!-- TopNavBar -->
<header class="flex justify-between items-center w-full px-8 py-4 h-20 sticky top-0 bg-slate-950/40 backdrop-blur-md z-40">
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
<p class="text-sm font-semibold text-on-surface"> Alex Sterling</p>
<p class="text-[10px] text-on-surface-variant font-medium">Chief Administrator</p>
</div>
<div class="w-10 h-10 rounded-full border-2 border-cyan-400/30 overflow-hidden group-hover:border-cyan-400 transition-all">
<img alt="User Profile" class="w-full h-full object-cover" data-alt="Close-up portrait of a professional man with a confident expression in high-end studio lighting with dark background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCe7POJMpFbtE00J-rigLWhKtcUX8ox-O0EHhxoKr1ImA4jSFgQ6ze5BIWHRxQBt8aZ1apUqJo8iGrp8ht6q8A3slZRxepxuP9RC2I7mu-Ze5xnBz-6hIWTEXl_iBGn4wciOOCM_XWzLrVpUuGvtjwmBaEs5GSc9LVwWGitHtOQ6gVkoRg_T7G5Z6Bf_pzHbW7amNDXFx9ODE7xa3vabpeg1NjzsF4ldxT0y3GjUvt5Skg5jtjtK-ESteQ3vzC5t7uZ4IQ2s44SOuU"/>
</div>
</div>
</div>
</header>
<!-- Dashboard Content -->
<div class="p-12 space-y-12 max-w-7xl mx-auto w-full">
<!-- Hero Welcome -->
<section>
<h2 class="text-5xl font-black font-headline tracking-tight text-on-surface mb-2">Welcome back, Curator.</h2>
<p class="text-on-surface-variant text-lg max-w-2xl">Your organizational performance is up 12.4% this month. Here's a curated look at your fleet's current status.</p>
</section>
<!-- KPI Bento Grid -->
<section class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
<!-- KPI Card 1 -->
<div class="glass-card rounded-xl p-8 relative overflow-hidden group hover:scale-[1.02] transition-all duration-300">
<div class="absolute left-0 top-0 bottom-0 w-1 bg-primary"></div>
<div class="flex justify-between items-start mb-6">
<div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary">
<span class="material-symbols-outlined" data-icon="group">group</span>
</div>
<span class="text-xs font-bold text-tertiary-dim bg-tertiary-dim/10 px-2 py-1 rounded">+3 this wk</span>
</div>
<p class="text-on-surface-variant font-medium text-sm mb-1">Total Employees</p>
<h3 class="text-4xl font-bold font-headline text-on-surface">124</h3>
</div>
<!-- KPI Card 2 -->
<div class="glass-card rounded-xl p-8 relative overflow-hidden group hover:scale-[1.02] transition-all duration-300">
<div class="absolute left-0 top-0 bottom-0 w-1 bg-tertiary"></div>
<div class="flex justify-between items-start mb-6">
<div class="w-12 h-12 rounded-lg bg-tertiary/10 flex items-center justify-center text-tertiary">
<span class="material-symbols-outlined" data-icon="verified">verified</span>
</div>
<div class="flex items-center gap-1 text-tertiary">
<span class="w-2 h-2 rounded-full bg-tertiary animate-pulse"></span>
<span class="text-xs font-bold">95.1%</span>
</div>
</div>
<p class="text-on-surface-variant font-medium text-sm mb-1">Active Now</p>
<h3 class="text-4xl font-bold font-headline text-on-surface">118</h3>
</div>
<!-- KPI Card 3 -->
<div class="glass-card rounded-xl p-8 relative overflow-hidden group hover:scale-[1.02] transition-all duration-300">
<div class="absolute left-0 top-0 bottom-0 w-1 bg-secondary"></div>
<div class="flex justify-between items-start mb-6">
<div class="w-12 h-12 rounded-lg bg-secondary/10 flex items-center justify-center text-secondary">
<span class="material-symbols-outlined" data-icon="hub">hub</span>
</div>
</div>
<p class="text-on-surface-variant font-medium text-sm mb-1">Departments</p>
<h3 class="text-4xl font-bold font-headline text-on-surface">8</h3>
</div>
<!-- KPI Card 4 -->
<div class="glass-card rounded-xl p-8 relative overflow-hidden group hover:scale-[1.02] transition-all duration-300">
<div class="absolute left-0 top-0 bottom-0 w-1 bg-gradient-to-b from-primary to-secondary"></div>
<div class="flex justify-between items-start mb-6">
<div class="w-12 h-12 rounded-lg bg-surface-container-highest flex items-center justify-center text-primary-fixed">
<span class="material-symbols-outlined" data-icon="payments">payments</span>
</div>
</div>
<p class="text-on-surface-variant font-medium text-sm mb-1">Monthly Payroll</p>
<h3 class="text-4xl font-bold font-headline text-on-surface">$450k</h3>
</div>
</section>
<!-- Asymmetric Main Layout -->
<div class="grid grid-cols-1 lg:grid-cols-3 gap-12">
<!-- Left: Recent Activity List -->
<div class="lg:col-span-2 space-y-8">
<div class="flex items-end justify-between">
<div>
<h4 class="text-2xl font-bold font-headline">Recent Talent Fluidity</h4>
<p class="text-on-surface-variant text-sm">Last 24 hours of activity across all pods</p>
</div>
<button class="text-primary text-sm font-semibold hover:underline">View All Records</button>
</div>
<div class="space-y-4">
<!-- Activity Row -->
<div class="flex items-center p-6 bg-surface-container-low hover:bg-surface-container transition-all duration-300 rounded-xl group cursor-pointer">
<div class="w-12 h-12 rounded-full overflow-hidden mr-6 ring-2 ring-primary/20">
<img alt="Employee" class="w-full h-full object-cover" data-alt="Headshot of a smiling young woman with dark hair in a professional office setting with soft bokeh background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuC9s57sFjDqrcG9trLckjyqMQnWtRIxmy2RU1t5bHiIqqlt3m5Z4ZKkaKNJ5w5bFfnESt9L23TQrF_pKCBkPRpxDoY1peRkJzLWmDgGxY3MFilIdJQkTnEplX0jPU_rtI2xCBOyDumRAHFTFXG-wZ3XCMHgKkrQtcVm5LNKRD8r_lMqTeOGYK_JQZK0beh6rqOQ9cmhKDeOV_ucvUbYjwFE-atNjWLE-9Wd3z6iFuRZIAql1u3nCJf_3RrB9aDudNwkxTnr50a2xGI"/>
</div>
<div class="flex-1">
<h5 class="font-bold text-on-surface group-hover:text-primary transition-colors">Sarah Jenkins</h5>
<p class="text-xs text-on-surface-variant">Senior Design Lead • UI/UX Pod</p>
</div>
<div class="text-right">
<p class="text-sm font-bold text-tertiary">Promoted</p>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest">2 Hours Ago</p>
</div>
</div>
<!-- Activity Row -->
<div class="flex items-center p-6 bg-surface-container-low hover:bg-surface-container transition-all duration-300 rounded-xl group cursor-pointer">
<div class="w-12 h-12 rounded-full overflow-hidden mr-6 ring-2 ring-secondary/20">
<img alt="Employee" class="w-full h-full object-cover" data-alt="Portrait of a creative man with stylish glasses and a modern haircut in a bright studio environment" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA3yM3vf7dp_MjYsK-g_-ibWCNTDvC2-qjtIYHNwWOaReK41CY-Whv4tiLeRuFh9TjKBR8D-DyseFjgyCGHuJB-1YF863fN5BfpsaNAuxFOl0G3gY9hAo9F8cRUEQbi_TIhtR-5SeoHuAW-gvXeUFqQ6TMBMiPnsGYNw1nPqRk75sCD0q0ODOOjFePDm2h-oe9BK-ieMl-5jxgadM9QgLmxvV06ry9jz5A0a2VJArTuOgSooq-J1Qb6xcpo2Cay2SmjSt1LM6CtbpU"/>
</div>
<div class="flex-1">
<h5 class="font-bold text-on-surface group-hover:text-primary transition-colors">Marcus Thorne</h5>
<p class="text-xs text-on-surface-variant">Cloud Architect • Infrastructure</p>
</div>
<div class="text-right">
<p class="text-sm font-bold text-primary">Onboarded</p>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest">5 Hours Ago</p>
</div>
</div>
<!-- Activity Row -->
<div class="flex items-center p-6 bg-surface-container-low hover:bg-surface-container transition-all duration-300 rounded-xl group cursor-pointer">
<div class="w-12 h-12 rounded-full overflow-hidden mr-6 ring-2 ring-tertiary/20">
<img alt="Employee" class="w-full h-full object-cover" data-alt="Professional woman looking confidently at the camera, neutral background, sharp business attire" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA9kDFiSS0wZam1umuO2oj0-YaZTKeKZS-YoeyF1AAwnk9hk4me8Nwl-w9N_Kugz149ORwUROGKr7VRoXq4Umr5nWWjuwjSQXQ-2wT8L08jUHwXXr-U-4y5KA72-gQodiGXpGa6mRZEO8wV9CZAsn6pbMm_LTVPxLRvZpNTQA0NZeJs7dVJocMV2RblpH2So-IjTjlze9ovlM2RBoOaWGVLUsSAmqRQbs8NsEoDFFAwERfxSaoRcpTXaAmZrHtxM4RSGdG_nbrjIVk"/>
</div>
<div class="flex-1">
<h5 class="font-bold text-on-surface group-hover:text-primary transition-colors">Elena Rodriguez</h5>
<p class="text-xs text-on-surface-variant">Financial Analyst • Operations</p>
</div>
<div class="text-right">
<p class="text-sm font-bold text-on-surface">Updated Profile</p>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest">8 Hours Ago</p>
</div>
</div>
</div>
</div>
<!-- Right: Department Distribution -->
<div class="space-y-8">
<div class="glass-card rounded-xl p-8 h-full">
<h4 class="text-xl font-bold font-headline mb-6">Departmental Hubs</h4>
<div class="space-y-6">
<div>
<div class="flex justify-between text-sm mb-2">
<span class="text-on-surface-variant">Engineering</span>
<span class="text-on-surface font-bold">42%</span>
</div>
<div class="h-1.5 w-full bg-surface-container-highest rounded-full overflow-hidden">
<div class="h-full bg-primary rounded-full" style="width: 42%"></div>
</div>
</div>
<div>
<div class="flex justify-between text-sm mb-2">
<span class="text-on-surface-variant">Product &amp; Design</span>
<span class="text-on-surface font-bold">28%</span>
</div>
<div class="h-1.5 w-full bg-surface-container-highest rounded-full overflow-hidden">
<div class="h-full bg-secondary rounded-full" style="width: 28%"></div>
</div>
</div>
<div>
<div class="flex justify-between text-sm mb-2">
<span class="text-on-surface-variant">Marketing</span>
<span class="text-on-surface font-bold">15%</span>
</div>
<div class="h-1.5 w-full bg-surface-container-highest rounded-full overflow-hidden">
<div class="h-full bg-tertiary rounded-full" style="width: 15%"></div>
</div>
</div>
<div>
<div class="flex justify-between text-sm mb-2">
<span class="text-on-surface-variant">Operations</span>
<span class="text-on-surface font-bold">10%</span>
</div>
<div class="h-1.5 w-full bg-surface-container-highest rounded-full overflow-hidden">
<div class="h-full bg-on-surface-variant rounded-full" style="width: 10%"></div>
</div>
</div>
</div>
<div class="mt-12 p-6 rounded-xl bg-gradient-to-br from-primary/10 to-secondary/10 border border-white/5">
<p class="text-sm font-medium text-primary mb-2">Curator's Insight</p>
<p class="text-xs text-on-surface-variant leading-relaxed">Engineering capacity has increased by 15% since the Q3 hiring initiative. Consider rebalancing project loads.</p>
</div>
</div>
</div>
</div>
</div>
</main>
</div>
</body></html>