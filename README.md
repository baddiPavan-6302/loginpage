<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Pavan — QA Test Engineer</title>
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet"/>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    :root {
      --bg: #060810; --bg2: #0b0e18; --panel: #0f1220;
      --border: rgba(255,255,255,0.07); --accent: #00d4ff;
      --accent2: #7b61ff; --green: #00e5a0; --text: #dde4f0; --muted: #4a5568;
    }
    html { scroll-behavior: smooth; }
    body { font-family: 'DM Sans', sans-serif; background: var(--bg); color: var(--text); overflow-x: hidden; }
    body::before {
      content: ''; position: fixed; inset: 0; pointer-events: none; z-index: 0;
      background-image: linear-gradient(rgba(0,212,255,0.03) 1px, transparent 1px),
                        linear-gradient(90deg, rgba(0,212,255,0.03) 1px, transparent 1px);
      background-size: 50px 50px;
    }
    nav {
      position: fixed; top: 0; left: 0; right: 0; z-index: 100;
      display: flex; align-items: center; justify-content: space-between;
      padding: 18px 60px; background: rgba(6,8,16,0.9); backdrop-filter: blur(20px);
      border-bottom: 1px solid var(--border);
    }
    .nav-logo { font-family: 'Syne', sans-serif; font-size: 20px; font-weight: 800; }
    .nav-logo span { color: var(--accent); }
    .nav-links { display: flex; gap: 32px; }
    .nav-links a { color: var(--muted); text-decoration: none; font-size: 14px; font-weight: 500; transition: color 0.2s; }
    .nav-links a:hover { color: var(--accent); }
    .nav-cta { padding: 9px 22px; background: transparent; border: 1px solid var(--accent); color: var(--accent); font-family: 'DM Sans', sans-serif; font-size: 13px; font-weight: 500; border-radius: 6px; cursor: pointer; text-decoration: none; transition: all 0.2s; }
    .nav-cta:hover { background: var(--accent); color: var(--bg); }
    .hero { min-height: 100vh; display: flex; align-items: center; padding: 120px 60px 80px; position: relative; overflow: hidden; }
    .hero-glow { position: absolute; width: 700px; height: 700px; border-radius: 50%; background: radial-gradient(circle, rgba(0,212,255,0.06) 0%, transparent 65%); top: -10%; right: -10%; pointer-events: none; animation: breathe 7s ease-in-out infinite alternate; }
    .hero-glow2 { position: absolute; width: 400px; height: 400px; border-radius: 50%; background: radial-gradient(circle, rgba(123,97,255,0.07) 0%, transparent 65%); bottom: 5%; left: 0; pointer-events: none; animation: breathe 9s ease-in-out infinite alternate-reverse; }
    @keyframes breathe { from { transform: scale(1); } to { transform: scale(1.15); } }
    .hero-content { position: relative; z-index: 1; max-width: 720px; }
    .hero-badge { display: inline-flex; align-items: center; gap: 8px; background: rgba(0,212,255,0.08); border: 1px solid rgba(0,212,255,0.2); border-radius: 30px; padding: 6px 16px; font-size: 12px; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent); font-weight: 600; margin-bottom: 28px; }
    .badge-dot { width: 7px; height: 7px; background: var(--accent); border-radius: 50%; animation: blink 1.5s ease-in-out infinite; }
    @keyframes blink { 0%,100% { opacity: 1; } 50% { opacity: 0.3; } }
    h1 { font-family: 'Syne', sans-serif; font-size: clamp(48px, 6.5vw, 84px); font-weight: 800; line-height: 1.02; letter-spacing: -0.03em; margin-bottom: 24px; }
    h1 .accent { color: var(--accent); } h1 .accent2 { color: var(--accent2); }
    .hero-desc { font-size: 17px; color: var(--muted); line-height: 1.75; max-width: 520px; margin-bottom: 40px; }
    .hero-btns { display: flex; gap: 14px; flex-wrap: wrap; margin-bottom: 56px; }
    .btn-primary { padding: 14px 32px; background: linear-gradient(135deg, var(--accent), var(--accent2)); color: #fff; font-family: 'DM Sans', sans-serif; font-weight: 600; font-size: 15px; border: none; border-radius: 8px; cursor: pointer; text-decoration: none; display: inline-flex; align-items: center; gap: 8px; transition: transform 0.2s, box-shadow 0.2s; box-shadow: 0 0 30px rgba(0,212,255,0.2); }
    .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 8px 40px rgba(0,212,255,0.3); }
    .btn-outline { padding: 14px 32px; background: transparent; color: var(--text); border: 1px solid var(--border); border-radius: 8px; font-family: 'DM Sans', sans-serif; font-weight: 500; font-size: 15px; cursor: pointer; text-decoration: none; transition: border-color 0.2s, color 0.2s; }
    .btn-outline:hover { border-color: var(--accent); color: var(--accent); }
    .hero-stats { display: flex; gap: 40px; }
    .hstat-num { font-family: 'Syne', sans-serif; font-size: 32px; font-weight: 800; color: var(--accent); }
    .hstat-lbl { font-size: 12px; color: var(--muted); margin-top: 2px; }
    .hstat-divider { width: 1px; background: var(--border); }
    section { padding: 100px 60px; position: relative; z-index: 1; }
    .section-tag { font-size: 11px; letter-spacing: 0.15em; text-transform: uppercase; color: var(--accent); font-weight: 600; margin-bottom: 12px; }
    h2 { font-family: 'Syne', sans-serif; font-size: clamp(30px, 4vw, 46px); font-weight: 800; letter-spacing: -0.02em; margin-bottom: 14px; }
    .section-desc { color: var(--muted); font-size: 16px; line-height: 1.7; max-width: 520px; margin-bottom: 56px; }
    .testing-section { background: var(--bg2); }
    .testing-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; }
    .testing-card { background: var(--panel); border: 1px solid var(--border); border-radius: 20px; padding: 36px; position: relative; overflow: hidden; transition: border-color 0.3s, transform 0.3s; }
    .testing-card:hover { border-color: var(--accent); transform: translateY(-4px); }
    .testing-card::before { content: ''; position: absolute; top: 0; left: 0; right: 0; height: 3px; background: linear-gradient(90deg, var(--accent), var(--accent2)); opacity: 0; transition: opacity 0.3s; }
    .testing-card:hover::before { opacity: 1; }
    .card-icon { font-size: 40px; margin-bottom: 18px; }
    .card-title { font-family: 'Syne', sans-serif; font-size: 22px; font-weight: 700; margin-bottom: 12px; }
    .card-desc { font-size: 14px; color: var(--muted); line-height: 1.7; margin-bottom: 20px; }
    .card-skills { display: flex; flex-wrap: wrap; gap: 8px; }
    .chip { font-size: 12px; padding: 5px 12px; background: rgba(0,212,255,0.08); border: 1px solid rgba(0,212,255,0.15); color: var(--accent); border-radius: 20px; font-weight: 500; }
    .chip.purple { background: rgba(123,97,255,0.08); border-color: rgba(123,97,255,0.2); color: var(--accent2); }
    .chip.green { background: rgba(0,229,160,0.08); border-color: rgba(0,229,160,0.2); color: var(--green); }
    .tools-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(130px,1fr)); gap: 16px; }
    .tool-card { background: var(--panel); border: 1px solid var(--border); border-radius: 14px; padding: 22px 16px; text-align: center; transition: border-color 0.25s, transform 0.25s; cursor: default; }
    .tool-card:hover { border-color: var(--accent2); transform: translateY(-4px); }
    .tool-icon { font-size: 28px; margin-bottom: 10px; }
    .tool-name { font-size: 13px; font-weight: 600; color: var(--text); margin-bottom: 4px; }
    .tool-type { font-size: 11px; color: var(--muted); }
    .projects-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px,1fr)); gap: 24px; }
    .project-card { background: var(--panel); border: 1px solid var(--border); border-radius: 18px; overflow: hidden; transition: border-color 0.25s, transform 0.25s; }
    .project-card:hover { border-color: var(--accent); transform: translateY(-4px); }
    .project-header { padding: 24px; border-bottom: 1px solid var(--border); display: flex; align-items: center; gap: 16px; }
    .proj-icon { width: 52px; height: 52px; border-radius: 14px; background: linear-gradient(135deg, rgba(0,212,255,0.15), rgba(123,97,255,0.15)); border: 1px solid rgba(0,212,255,0.2); display: flex; align-items: center; justify-content: center; font-size: 24px; }
    .proj-title { font-family: 'Syne', sans-serif; font-size: 18px; font-weight: 700; }
    .proj-type { font-size: 12px; color: var(--accent); margin-top: 2px; }
    .project-body { padding: 24px; }
    .proj-desc { font-size: 14px; color: var(--muted); line-height: 1.7; margin-bottom: 18px; }
    .proj-tags { display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 20px; }
    .ptag { font-size: 11px; padding: 4px 10px; background: rgba(123,97,255,0.1); color: var(--accent2); border-radius: 20px; font-weight: 500; }
    .proj-link { font-size: 13px; color: var(--accent); text-decoration: none; font-weight: 500; display: inline-flex; align-items: center; gap: 5px; transition: gap 0.2s; }
    .proj-link:hover { gap: 8px; }
    .process-section { background: var(--bg2); }
    .process-steps { display: grid; grid-template-columns: repeat(5, 1fr); gap: 0; position: relative; }
    .process-steps::before { content: ''; position: absolute; top: 36px; left: 10%; right: 10%; height: 1px; background: linear-gradient(90deg, transparent, var(--accent), var(--accent2), transparent); }
    .step { text-align: center; padding: 0 16px; position: relative; z-index: 1; }
    .step-num { width: 72px; height: 72px; border-radius: 50%; background: var(--panel); border: 2px solid var(--border); display: flex; align-items: center; justify-content: center; font-family: 'Syne', sans-serif; font-size: 20px; font-weight: 800; color: var(--accent); margin: 0 auto 18px; transition: border-color 0.3s, box-shadow 0.3s; }
    .step:hover .step-num { border-color: var(--accent); box-shadow: 0 0 20px rgba(0,212,255,0.2); }
    .step-title { font-family: 'Syne', sans-serif; font-size: 15px; font-weight: 700; margin-bottom: 8px; }
    .step-desc { font-size: 13px; color: var(--muted); line-height: 1.6; }
    .about-grid { display: grid; grid-template-columns: 1fr 1.2fr; gap: 60px; align-items: center; }
    .about-terminal { background: #0a0c14; border: 1px solid var(--border); border-radius: 16px; overflow: hidden; font-family: 'Courier New', monospace; font-size: 14px; }
    .terminal-bar { background: #13161e; padding: 12px 16px; display: flex; align-items: center; gap: 8px; border-bottom: 1px solid var(--border); }
    .t-dot { width: 12px; height: 12px; border-radius: 50%; }
    .t-red { background: #ff5f57; } .t-yellow { background: #ffbd2e; } .t-green-dot { background: #28c840; }
    .terminal-title { font-size: 13px; color: var(--muted); margin-left: 8px; font-family: 'DM Sans', sans-serif; }
    .terminal-body { padding: 24px; line-height: 2; }
    .t-prompt { color: var(--accent); } .t-cmd { color: var(--text); } .t-out { color: #5a7a6a; } .t-val { color: var(--green); } .t-key { color: var(--accent2); }
    .t-cursor { display: inline-block; width: 8px; height: 16px; background: var(--accent); animation: blink 1s infinite; vertical-align: middle; }
    .about-text p { font-size: 16px; color: var(--muted); line-height: 1.8; margin-bottom: 16px; }
    .about-highlights { display: flex; flex-direction: column; gap: 12px; margin-top: 28px; }
    .highlight { display: flex; align-items: center; gap: 14px; background: var(--panel); border: 1px solid var(--border); border-radius: 10px; padding: 14px 18px; transition: border-color 0.2s; }
    .highlight:hover { border-color: var(--accent); }
    .hl-icon { font-size: 20px; } .hl-text { font-size: 14px; font-weight: 500; }
    .contact-inner { max-width: 640px; margin: 0 auto; text-align: center; }
    .contact-inner .section-desc { margin: 0 auto 40px; }
    .contact-cards { display: flex; gap: 16px; justify-content: center; flex-wrap: wrap; }
    .contact-card { display: flex; align-items: center; gap: 12px; padding: 16px 24px; background: var(--panel); border: 1px solid var(--border); border-radius: 12px; color: var(--text); text-decoration: none; font-size: 14px; font-weight: 500; transition: border-color 0.2s, color 0.2s, transform 0.2s; }
    .contact-card:hover { border-color: var(--accent); color: var(--accent); transform: translateY(-3px); }
    footer { border-top: 1px solid var(--border); padding: 28px 60px; display: flex; align-items: center; justify-content: space-between; font-size: 13px; color: var(--muted); position: relative; z-index: 1; }
    footer span { color: var(--accent); }
    @media (max-width: 768px) {
      nav { padding: 16px 20px; } .nav-links { display: none; }
      .hero, section { padding: 100px 20px 60px; } h1 { font-size: 40px; }
      .testing-grid, .about-grid { grid-template-columns: 1fr; }
      .process-steps { grid-template-columns: 1fr 1fr; } .process-steps::before { display: none; }
      .hero-stats { gap: 20px; } footer { padding: 20px; flex-direction: column; gap: 8px; text-align: center; }
    }
  </style>
</head>
<body>

<nav>
  <div class="nav-logo">Pavan <span>QA</span></div>
  <div class="nav-links">
    <a href="#testing">Testing</a>
    <a href="#tools">Tools</a>
    <a href="#projects">Projects</a>
    <a href="#process">Process</a>
    <a href="#contact">Contact</a>
  </div>
  <a href="#contact" class="nav-cta">Hire Me</a>
</nav>

<section class="hero" id="home">
  <div class="hero-glow"></div>
  <div class="hero-glow2"></div>
  <div class="hero-content">
    <div class="hero-badge"><div class="badge-dot"></div> Available for QA Roles</div>
    <h1>QA Test<br/><span class="accent">Engineer</span> &<br/><span class="accent2">Bug Hunter</span></h1>
    <p class="hero-desc">Hi, I'm <strong>Pavan</strong> — a passionate QA Engineer specializing in <strong>Manual Testing</strong> & <strong>Automation Testing</strong>. I ensure software quality through meticulous test planning, execution, and automation frameworks.</p>
    <div class="hero-btns">
      <a href="#projects" class="btn-primary">View My Work →</a>
      <a href="#contact" class="btn-outline">Get In Touch</a>
    </div>
    <div class="hero-stats">
      <div><div class="hstat-num">20+</div><div class="hstat-lbl">Test Cases Written</div></div>
      <div class="hstat-divider"></div>
      <div><div class="hstat-num">5+</div><div class="hstat-lbl">Projects Tested</div></div>
      <div class="hstat-divider"></div>
      <div><div class="hstat-num">0</div><div class="hstat-lbl">Critical Bugs Missed</div></div>
    </div>
  </div>
</section>

<section class="testing-section" id="testing">
  <div class="section-tag">Core Expertise</div>
  <h2>Testing Specializations</h2>
  <p class="section-desc">From manual exploratory testing to full automation frameworks — complete QA lifecycle coverage.</p>
  <div class="testing-grid">
    <div class="testing-card">
      <div class="card-icon">🧪</div>
      <div class="card-title">Manual Testing</div>
      <p class="card-desc">Thoroughly testing applications by hand — exploring edge cases, validating UI/UX, and ensuring software meets all requirements before release.</p>
      <div class="card-skills">
        <span class="chip">Test Case Writing</span><span class="chip">Bug Reporting</span>
        <span class="chip">Regression Testing</span><span class="chip">Smoke Testing</span>
        <span class="chip">UAT</span><span class="chip">Exploratory</span>
      </div>
    </div>
    <div class="testing-card">
      <div class="card-icon">🤖</div>
      <div class="card-title">Automation Testing</div>
      <p class="card-desc">Building robust automated test suites to speed up regression cycles, reduce human error, and enable continuous quality assurance in CI/CD pipelines.</p>
      <div class="card-skills">
        <span class="chip purple">Selenium WebDriver</span><span class="chip purple">TestNG</span>
        <span class="chip purple">Maven</span><span class="chip purple">Page Object Model</span>
        <span class="chip purple">Data-Driven</span>
      </div>
    </div>
    <div class="testing-card">
      <div class="card-icon">🌐</div>
      <div class="card-title">API Testing</div>
      <p class="card-desc">Validating REST APIs — testing request/response cycles, authentication, status codes, and ensuring backend services work flawlessly.</p>
      <div class="card-skills">
        <span class="chip green">Postman</span><span class="chip green">REST API</span>
        <span class="chip green">JSON Validation</span><span class="chip green">Collections</span>
      </div>
    </div>
    <div class="testing-card">
      <div class="card-icon">📋</div>
      <div class="card-title">Test Documentation</div>
      <p class="card-desc">Creating clear test plans, detailed test cases, traceability matrices, and comprehensive bug reports that communicate effectively with dev teams.</p>
      <div class="card-skills">
        <span class="chip">Test Plan</span><span class="chip">Test Cases</span>
        <span class="chip">Bug Reports</span><span class="chip">RTM</span><span class="chip">JIRA</span>
      </div>
    </div>
  </div>
</section>

<section id="tools">
  <div class="section-tag">Tech Stack</div>
  <h2>Tools & Technologies</h2>
  <p class="section-desc">The tools I use daily to ensure software quality.</p>
  <div class="tools-grid">
    <div class="tool-card"><div class="tool-icon">🔵</div><div class="tool-name">Selenium</div><div class="tool-type">Automation</div></div>
    <div class="tool-card"><div class="tool-icon">☕</div><div class="tool-name">Java</div><div class="tool-type">Language</div></div>
    <div class="tool-card"><div class="tool-icon">🧪</div><div class="tool-name">TestNG</div><div class="tool-type">Framework</div></div>
    <div class="tool-card"><div class="tool-icon">📮</div><div class="tool-name">Postman</div><div class="tool-type">API Testing</div></div>
    <div class="tool-card"><div class="tool-icon">🐛</div><div class="tool-name">JIRA</div><div class="tool-type">Bug Tracking</div></div>
    <div class="tool-card"><div class="tool-icon">📊</div><div class="tool-name">Excel</div><div class="tool-type">Test Cases</div></div>
    <div class="tool-card"><div class="tool-icon">🔧</div><div class="tool-name">Maven</div><div class="tool-type">Build Tool</div></div>
    <div class="tool-card"><div class="tool-icon">💻</div><div class="tool-name">Git</div><div class="tool-type">Version Control</div></div>
  </div>
</section>

<section style="background:var(--bg2)" id="projects">
  <div class="section-tag">My Work</div>
  <h2>Testing Projects</h2>
  <p class="section-desc">Real-world QA projects — test plans, automation scripts, and bug reports.</p>
  <div class="projects-grid">
    <div class="project-card">
      <div class="project-header">
        <div class="proj-icon">🛒</div>
        <div><div class="proj-title">E-Commerce Testing</div><div class="proj-type">Manual + Automation</div></div>
      </div>
      <div class="project-body">
        <p class="proj-desc">End-to-end testing of an e-commerce platform — login, product search, cart, checkout, and payment flows. Automated regression suite with Selenium + TestNG.</p>
        <div class="proj-tags"><span class="ptag">Selenium</span><span class="ptag">TestNG</span><span class="ptag">Java</span><span class="ptag">Manual</span></div>
        <a href="https://github.com/baddiPavan-6302" class="proj-link" target="_blank">View on GitHub →</a>
      </div>
    </div>
    <div class="project-card">
      <div class="project-header">
        <div class="proj-icon">🔐</div>
        <div><div class="proj-title">Login Page Testing</div><div class="proj-type">Manual Testing</div></div>
      </div>
      <div class="project-body">
        <p class="proj-desc">Comprehensive manual testing of login functionality — positive/negative test cases, boundary value analysis, and detailed bug reports for all edge cases.</p>
        <div class="proj-tags"><span class="ptag">Test Cases</span><span class="ptag">BVA</span><span class="ptag">Bug Reports</span><span class="ptag">Manual</span></div>
        <a href="https://github.com/baddiPavan-6302/loginpage" class="proj-link" target="_blank">View on GitHub →</a>
      </div>
    </div>
    <div class="project-card">
      <div class="project-header">
        <div class="proj-icon">🌐</div>
        <div><div class="proj-title">REST API Testing</div><div class="proj-type">API Testing</div></div>
      </div>
      <div class="project-body">
        <p class="proj-desc">API validation using Postman — testing CRUD operations, authentication endpoints, error handling, and response schema validation for a RESTful service.</p>
        <div class="proj-tags"><span class="ptag">Postman</span><span class="ptag">REST API</span><span class="ptag">JSON</span><span class="ptag">Collections</span></div>
        <a href="https://github.com/baddiPavan-6302" class="proj-link" target="_blank">View on GitHub →</a>
      </div>
    </div>
  </div>
</section>

<section class="process-section" id="process">
  <div class="section-tag">How I Work</div>
  <h2>My QA Process</h2>
  <p class="section-desc">A structured, thorough approach to software quality assurance.</p>
  <div class="process-steps">
    <div class="step"><div class="step-num">01</div><div class="step-title">Requirement Analysis</div><p class="step-desc">Study requirements, identify testable scenarios</p></div>
    <div class="step"><div class="step-num">02</div><div class="step-title">Test Planning</div><p class="step-desc">Define scope, strategy, test types</p></div>
    <div class="step"><div class="step-num">03</div><div class="step-title">Test Case Design</div><p class="step-desc">Write detailed positive, negative & edge cases</p></div>
    <div class="step"><div class="step-num">04</div><div class="step-title">Test Execution</div><p class="step-desc">Execute manual & automated tests, log bugs</p></div>
    <div class="step"><div class="step-num">05</div><div class="step-title">Report & Sign-off</div><p class="step-desc">Deliver test summary report and quality sign-off</p></div>
  </div>
</section>

<section id="about">
  <div class="about-grid">
    <div>
      <div class="about-terminal">
        <div class="terminal-bar">
          <div class="t-dot t-red"></div><div class="t-dot t-yellow"></div><div class="t-dot t-green-dot"></div>
          <span class="terminal-title">pavan@qa-engineer ~ $</span>
        </div>
        <div class="terminal-body">
          <div><span class="t-prompt">$ </span><span class="t-cmd">cat profile.json</span></div>
          <div class="t-out">{</div>
          <div>&nbsp;&nbsp;<span class="t-key">"name"</span>: <span class="t-val">"Baddi Pavan"</span>,</div>
          <div>&nbsp;&nbsp;<span class="t-key">"role"</span>: <span class="t-val">"QA Test Engineer"</span>,</div>
          <div>&nbsp;&nbsp;<span class="t-key">"location"</span>: <span class="t-val">"Andhra Pradesh, India"</span>,</div>
          <div>&nbsp;&nbsp;<span class="t-key">"testing"</span>: [</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;<span class="t-val">"Manual Testing"</span>,</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;<span class="t-val">"Automation Testing"</span>,</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;<span class="t-val">"API Testing"</span></div>
          <div>&nbsp;&nbsp;],</div>
          <div>&nbsp;&nbsp;<span class="t-key">"status"</span>: <span class="t-val">"Open to Work ✅"</span></div>
          <div class="t-out">}</div>
          <div><span class="t-prompt">$ </span><span class="t-cursor"></span></div>
        </div>
      </div>
    </div>
    <div class="about-text">
      <div class="section-tag">About Me</div>
      <h2>Passionate About Quality</h2>
      <p>I'm a dedicated QA Engineer from Andhra Pradesh with a strong focus on delivering bug-free, high-quality software. I believe quality is not an act — it's a habit.</p>
      <p>I combine systematic manual testing with smart automation to give development teams fast, reliable feedback so they can ship with confidence.</p>
      <div class="about-highlights">
        <div class="highlight"><span class="hl-icon">🎯</span><span class="hl-text">Detail-oriented — no bug escapes my test cases</span></div>
        <div class="highlight"><span class="hl-icon">⚡</span><span class="hl-text">Fast learner — quickly adapts to new tools & frameworks</span></div>
        <div class="highlight"><span class="hl-icon">🤝</span><span class="hl-text">Team player — works closely with devs to fix issues fast</span></div>
        <div class="highlight"><span class="hl-icon">📈</span><span class="hl-text">Always improving — continuously learning new QA skills</span></div>
      </div>
    </div>
  </div>
</section>

<section style="background:var(--bg2)" id="contact">
  <div class="contact-inner">
    <div class="section-tag">Get In Touch</div>
    <h2>Let's Work Together</h2>
    <p class="section-desc">Looking for a QA Engineer? I'm available for full-time, part-time, and freelance testing projects.</p>
    <div class="contact-cards">
      <a href="mailto:baddiPavan6302@gmail.com" class="contact-card">✉️ baddiPavan6302@gmail.com</a>
      <a href="https://github.com/baddiPavan-6302" target="_blank" class="contact-card">💻 GitHub</a>
      <a href="https://linkedin.com/in/baddiPavan" target="_blank" class="contact-card">🔗 LinkedIn</a>
    </div>
  </div>
</section>

<footer>
  <div>Built by <span>Pavan</span> — QA Engineer 🧪</div>
  <div>© 2025 baddiPavan-6302</div>
</footer>

</body>
</html>
