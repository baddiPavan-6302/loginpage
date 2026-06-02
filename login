<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Pavan — Frontend Developer</title>
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet"/>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --bg: #080a0e;
      --bg2: #0e1117;
      --panel: #12151d;
      --border: rgba(255,255,255,0.07);
      --accent: #00e5a0;
      --accent2: #00c980;
      --text: #e8ede8;
      --muted: #5a6370;
      --white: #ffffff;
    }

    html { scroll-behavior: smooth; }

    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--bg);
      color: var(--text);
      overflow-x: hidden;
    }

    /* CURSOR */
    .cursor {
      width: 10px; height: 10px;
      background: var(--accent);
      border-radius: 50%;
      position: fixed; pointer-events: none;
      z-index: 9999;
      transition: transform 0.15s ease;
      mix-blend-mode: difference;
    }
    .cursor-ring {
      width: 36px; height: 36px;
      border: 1.5px solid var(--accent);
      border-radius: 50%;
      position: fixed; pointer-events: none;
      z-index: 9998;
      transition: transform 0.35s ease, width 0.2s, height 0.2s;
      opacity: 0.5;
    }

    /* NAV */
    nav {
      position: fixed; top: 0; left: 0; right: 0; z-index: 100;
      display: flex; align-items: center; justify-content: space-between;
      padding: 20px 60px;
      background: rgba(8,10,14,0.85);
      backdrop-filter: blur(16px);
      border-bottom: 1px solid var(--border);
    }
    .nav-logo {
      font-family: 'Syne', sans-serif;
      font-size: 22px; font-weight: 800;
      letter-spacing: -0.02em;
    }
    .nav-logo span { color: var(--accent); }
    .nav-links { display: flex; gap: 36px; }
    .nav-links a {
      color: var(--muted); text-decoration: none;
      font-size: 14px; font-weight: 500;
      transition: color 0.2s; letter-spacing: 0.04em;
    }
    .nav-links a:hover { color: var(--accent); }
    .nav-cta {
      padding: 9px 22px;
      background: transparent;
      border: 1px solid var(--accent);
      color: var(--accent);
      font-family: 'DM Sans', sans-serif;
      font-size: 13px; font-weight: 500;
      border-radius: 6px; cursor: pointer;
      transition: all 0.2s; text-decoration: none;
    }
    .nav-cta:hover { background: var(--accent); color: var(--bg); }

    /* HERO */
    .hero {
      min-height: 100vh;
      display: flex; align-items: center;
      padding: 120px 60px 80px;
      position: relative;
      overflow: hidden;
    }
    .hero-bg {
      position: absolute; inset: 0; pointer-events: none;
    }
    .hero-bg::before {
      content: '';
      position: absolute;
      width: 600px; height: 600px;
      background: radial-gradient(circle, rgba(0,229,160,0.08) 0%, transparent 70%);
      top: 10%; right: 5%;
      animation: pulse 6s ease-in-out infinite alternate;
    }
    .hero-bg::after {
      content: '';
      position: absolute;
      width: 300px; height: 300px;
      background: radial-gradient(circle, rgba(0,100,255,0.06) 0%, transparent 70%);
      bottom: 20%; left: 5%;
      animation: pulse 8s ease-in-out infinite alternate-reverse;
    }
    @keyframes pulse {
      from { transform: scale(1); opacity: 0.8; }
      to   { transform: scale(1.2); opacity: 1; }
    }

    /* grid lines */
    .grid-lines {
      position: absolute; inset: 0; pointer-events: none; opacity: 0.03;
      background-image:
        linear-gradient(var(--accent) 1px, transparent 1px),
        linear-gradient(90deg, var(--accent) 1px, transparent 1px);
      background-size: 60px 60px;
    }

    .hero-content { position: relative; z-index: 1; max-width: 700px; }
    .hero-tag {
      display: inline-flex; align-items: center; gap: 8px;
      font-size: 12px; letter-spacing: 0.12em; text-transform: uppercase;
      color: var(--accent); font-weight: 600;
      margin-bottom: 24px;
    }
    .hero-tag::before {
      content: ''; width: 24px; height: 1px; background: var(--accent);
    }

    h1 {
      font-family: 'Syne', sans-serif;
      font-size: clamp(52px, 7vw, 88px);
      font-weight: 800;
      line-height: 1.0;
      letter-spacing: -0.03em;
      margin-bottom: 24px;
    }
    h1 .line { display: block; overflow: hidden; }
    h1 .line span {
      display: block;
      animation: slideUp 0.7s cubic-bezier(0.16,1,0.3,1) both;
    }
    h1 .line:nth-child(1) span { animation-delay: 0.1s; }
    h1 .line:nth-child(2) span { animation-delay: 0.2s; }
    h1 .line:nth-child(3) span { animation-delay: 0.3s; color: var(--accent); }

    @keyframes slideUp {
      from { transform: translateY(100%); opacity: 0; }
      to   { transform: translateY(0); opacity: 1; }
    }

    .hero-desc {
      font-size: 17px; color: var(--muted); line-height: 1.7;
      max-width: 480px; margin-bottom: 40px;
      animation: fadeIn 0.8s 0.5s both;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(16px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .hero-btns {
      display: flex; gap: 16px; flex-wrap: wrap;
      animation: fadeIn 0.8s 0.6s both;
    }
    .btn-primary {
      padding: 14px 32px;
      background: var(--accent);
      color: var(--bg);
      font-family: 'DM Sans', sans-serif;
      font-weight: 600; font-size: 15px;
      border: none; border-radius: 8px; cursor: pointer;
      text-decoration: none; display: inline-flex; align-items: center; gap: 8px;
      transition: transform 0.2s, box-shadow 0.2s;
      box-shadow: 0 0 30px rgba(0,229,160,0.25);
    }
    .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 8px 40px rgba(0,229,160,0.35); }
    .btn-outline {
      padding: 14px 32px;
      background: transparent;
      color: var(--text);
      font-family: 'DM Sans', sans-serif;
      font-weight: 500; font-size: 15px;
      border: 1px solid var(--border);
      border-radius: 8px; cursor: pointer; text-decoration: none;
      transition: border-color 0.2s, color 0.2s;
    }
    .btn-outline:hover { border-color: var(--accent); color: var(--accent); }

    .hero-scroll {
      position: absolute; bottom: 40px; left: 60px;
      display: flex; align-items: center; gap: 12px;
      font-size: 12px; color: var(--muted); letter-spacing: 0.1em;
      text-transform: uppercase;
      animation: fadeIn 1s 1s both;
    }
    .scroll-line {
      width: 40px; height: 1px; background: var(--muted);
      animation: scrollPulse 2s ease-in-out infinite;
    }
    @keyframes scrollPulse {
      0%, 100% { width: 40px; opacity: 0.5; }
      50%       { width: 60px; opacity: 1; }
    }

    /* SECTION BASE */
    section { padding: 100px 60px; }
    .section-tag {
      font-size: 11px; letter-spacing: 0.15em; text-transform: uppercase;
      color: var(--accent); font-weight: 600; margin-bottom: 14px;
    }
    h2 {
      font-family: 'Syne', sans-serif;
      font-size: clamp(32px, 4vw, 48px);
      font-weight: 800; letter-spacing: -0.02em;
      margin-bottom: 16px; line-height: 1.1;
    }
    .section-desc { color: var(--muted); font-size: 16px; line-height: 1.7; max-width: 500px; margin-bottom: 60px; }

    /* SKILLS */
    .skills-section { background: var(--bg2); }
    .skills-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
      gap: 16px;
    }
    .skill-card {
      background: var(--panel);
      border: 1px solid var(--border);
      border-radius: 14px;
      padding: 24px 20px;
      text-align: center;
      transition: border-color 0.25s, transform 0.25s;
      cursor: default;
    }
    .skill-card:hover {
      border-color: var(--accent);
      transform: translateY(-4px);
    }
    .skill-icon { font-size: 32px; margin-bottom: 10px; }
    .skill-name { font-size: 13px; font-weight: 500; color: var(--text); }
    .skill-level {
      width: 100%; height: 3px;
      background: var(--border);
      border-radius: 2px; margin-top: 10px; overflow: hidden;
    }
    .skill-fill {
      height: 100%;
      background: linear-gradient(90deg, var(--accent2), var(--accent));
      border-radius: 2px;
      transition: width 1.5s cubic-bezier(0.16,1,0.3,1);
      width: 0;
    }
    .skill-fill.animated { width: var(--w); }

    /* PROJECTS */
    .projects-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
      gap: 24px;
    }
    .project-card {
      background: var(--panel);
      border: 1px solid var(--border);
      border-radius: 18px;
      overflow: hidden;
      transition: border-color 0.25s, transform 0.25s;
    }
    .project-card:hover { border-color: var(--accent); transform: translateY(-4px); }
    .project-thumb {
      height: 180px;
      display: flex; align-items: center; justify-content: center;
      font-size: 48px;
      position: relative; overflow: hidden;
    }
    .project-thumb::after {
      content: '';
      position: absolute; inset: 0;
      background: linear-gradient(180deg, transparent 50%, var(--panel));
    }
    .project-body { padding: 24px; }
    .project-tags { display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 12px; }
    .tag {
      font-size: 11px; padding: 4px 10px;
      background: rgba(0,229,160,0.08);
      color: var(--accent); border-radius: 20px;
      font-weight: 500; letter-spacing: 0.04em;
    }
    .project-title {
      font-family: 'Syne', sans-serif;
      font-size: 20px; font-weight: 700;
      margin-bottom: 8px;
    }
    .project-desc { font-size: 14px; color: var(--muted); line-height: 1.6; margin-bottom: 20px; }
    .project-links { display: flex; gap: 12px; }
    .proj-link {
      font-size: 13px; color: var(--accent);
      text-decoration: none; font-weight: 500;
      display: flex; align-items: center; gap: 5px;
      transition: gap 0.2s;
    }
    .proj-link:hover { gap: 8px; }

    /* ABOUT */
    .about-section { background: var(--bg2); }
    .about-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center; }
    .about-visual {
      position: relative; display: flex; align-items: center; justify-content: center;
    }
    .about-ring {
      width: 260px; height: 260px;
      border-radius: 50%;
      border: 1px solid rgba(0,229,160,0.2);
      display: flex; align-items: center; justify-content: center;
      animation: spin 20s linear infinite;
    }
    .about-ring::before {
      content: '';
      position: absolute;
      width: 12px; height: 12px;
      background: var(--accent);
      border-radius: 50%;
      top: 0; left: 50%;
      transform: translateX(-50%);
      box-shadow: 0 0 16px var(--accent);
    }
    @keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
    .about-avatar {
      width: 200px; height: 200px; border-radius: 50%;
      background: linear-gradient(135deg, var(--panel), #1a2030);
      border: 2px solid var(--border);
      display: flex; align-items: center; justify-content: center;
      font-size: 72px;
      position: absolute;
    }
    .about-text p { font-size: 16px; color: var(--muted); line-height: 1.8; margin-bottom: 20px; }
    .about-stats { display: flex; gap: 36px; margin-top: 32px; }
    .stat-item { }
    .stat-num {
      font-family: 'Syne', sans-serif;
      font-size: 36px; font-weight: 800; color: var(--accent);
      line-height: 1;
    }
    .stat-lbl { font-size: 13px; color: var(--muted); margin-top: 4px; }

    /* CONTACT */
    .contact-inner {
      max-width: 600px; margin: 0 auto; text-align: center;
    }
    .contact-inner h2 { margin-bottom: 12px; }
    .contact-inner .section-desc { margin: 0 auto 40px; }
    .contact-links { display: flex; gap: 16px; justify-content: center; flex-wrap: wrap; }
    .contact-link {
      display: flex; align-items: center; gap: 10px;
      padding: 14px 24px;
      background: var(--panel);
      border: 1px solid var(--border);
      border-radius: 10px;
      color: var(--text); text-decoration: none;
      font-size: 14px; font-weight: 500;
      transition: border-color 0.2s, color 0.2s, transform 0.2s;
    }
    .contact-link:hover { border-color: var(--accent); color: var(--accent); transform: translateY(-2px); }

    /* FOOTER */
    footer {
      border-top: 1px solid var(--border);
      padding: 28px 60px;
      display: flex; align-items: center; justify-content: space-between;
      font-size: 13px; color: var(--muted);
    }
    footer span { color: var(--accent); }

    /* RESPONSIVE */
    @media (max-width: 768px) {
      nav { padding: 16px 24px; }
      .nav-links { display: none; }
      .hero, section { padding: 100px 24px 60px; }
      h1 { font-size: 44px; }
      .about-grid { grid-template-columns: 1fr; }
      .about-visual { display: none; }
      .hero-scroll { left: 24px; }
      footer { padding: 20px 24px; flex-direction: column; gap: 8px; text-align: center; }
    }
  </style>
</head>
<body>

<div class="cursor" id="cursor"></div>
<div class="cursor-ring" id="cursorRing"></div>

<!-- NAV -->
<nav>
  <div class="nav-logo">P<span>.</span>avan</div>
  <div class="nav-links">
    <a href="#skills">Skills</a>
    <a href="#projects">Projects</a>
    <a href="#about">About</a>
    <a href="#contact">Contact</a>
  </div>
  <a href="#contact" class="nav-cta">Hire Me</a>
</nav>

<!-- HERO -->
<section class="hero" id="home">
  <div class="hero-bg"></div>
  <div class="grid-lines"></div>
  <div class="hero-content">
    <div class="hero-tag">Frontend Developer</div>
    <h1>
      <div class="line"><span>Building</span></div>
      <div class="line"><span>Modern</span></div>
      <div class="line"><span>Web Experiences</span></div>
    </h1>
    <p class="hero-desc">
      Hi, I'm <strong>Pavan</strong> — a passionate frontend developer who crafts clean, 
      responsive, and user-friendly web interfaces with HTML, CSS & JavaScript.
    </p>
    <div class="hero-btns">
      <a href="#projects" class="btn-primary">View My Work →</a>
      <a href="#contact" class="btn-outline">Get In Touch</a>
    </div>
  </div>
  <div class="hero-scroll">
    <div class="scroll-line"></div>
    Scroll down
  </div>
</section>

<!-- SKILLS -->
<section class="skills-section" id="skills">
  <div class="section-tag">What I Know</div>
  <h2>Skills & Tools</h2>
  <p class="section-desc">Technologies I use to build great web experiences.</p>
  <div class="skills-grid">
    <div class="skill-card">
      <div class="skill-icon">🌐</div>
      <div class="skill-name">HTML5</div>
      <div class="skill-level"><div class="skill-fill" style="--w:90%"></div></div>
    </div>
    <div class="skill-card">
      <div class="skill-icon">🎨</div>
      <div class="skill-name">CSS3</div>
      <div class="skill-level"><div class="skill-fill" style="--w:85%"></div></div>
    </div>
    <div class="skill-card">
      <div class="skill-icon">⚡</div>
      <div class="skill-name">JavaScript</div>
      <div class="skill-level"><div class="skill-fill" style="--w:70%"></div></div>
    </div>
    <div class="skill-card">
      <div class="skill-icon">📱</div>
      <div class="skill-name">Responsive</div>
      <div class="skill-level"><div class="skill-fill" style="--w:88%"></div></div>
    </div>
    <div class="skill-card">
      <div class="skill-icon">🔧</div>
      <div class="skill-name">Git</div>
      <div class="skill-level"><div class="skill-fill" style="--w:75%"></div></div>
    </div>
    <div class="skill-card">
      <div class="skill-icon">💻</div>
      <div class="skill-name">VS Code</div>
      <div class="skill-level"><div class="skill-fill" style="--w:92%"></div></div>
    </div>
  </div>
</section>

<!-- PROJECTS -->
<section id="projects">
  <div class="section-tag">My Work</div>
  <h2>Featured Projects</h2>
  <p class="section-desc">Things I've built and am proud of.</p>
  <div class="projects-grid">

    <div class="project-card">
      <div class="project-thumb" style="background: linear-gradient(135deg, #0d0f14, #1a2030);">🔐</div>
      <div class="project-body">
        <div class="project-tags">
          <span class="tag">HTML</span>
          <span class="tag">CSS</span>
          <span class="tag">JavaScript</span>
        </div>
        <div class="project-title">Login Page</div>
        <p class="project-desc">A modern, animated login & dashboard UI with dark gold theme, form validation, and smooth transitions.</p>
        <div class="project-links">
          <a href="https://github.com/baddiPavan-6302/loginpage" class="proj-link" target="_blank">GitHub →</a>
        </div>
      </div>
    </div>

    <div class="project-card">
      <div class="project-thumb" style="background: linear-gradient(135deg, #0a1520, #0d2030);">🌐</div>
      <div class="project-body">
        <div class="project-tags">
          <span class="tag">HTML</span>
          <span class="tag">CSS</span>
        </div>
        <div class="project-title">Portfolio Website</div>
        <p class="project-desc">This portfolio — designed with a bold dark aesthetic, smooth animations, and fully responsive layout.</p>
        <div class="project-links">
          <a href="https://github.com/baddiPavan-6302" class="proj-link" target="_blank">GitHub →</a>
        </div>
      </div>
    </div>

    <div class="project-card">
      <div class="project-thumb" style="background: linear-gradient(135deg, #0d1a10, #0a2015);">📝</div>
      <div class="project-body">
        <div class="project-tags">
          <span class="tag">HTML</span>
          <span class="tag">CSS</span>
          <span class="tag">JS</span>
        </div>
        <div class="project-title">Coming Soon...</div>
        <p class="project-desc">More projects in progress. Stay tuned for exciting new web experiences!</p>
        <div class="project-links">
          <a href="https://github.com/baddiPavan-6302" class="proj-link" target="_blank">View All →</a>
        </div>
      </div>
    </div>

  </div>
</section>

<!-- ABOUT -->
<section class="about-section" id="about">
  <div class="about-grid">
    <div class="about-visual">
      <div class="about-ring"></div>
      <div class="about-avatar">👨‍💻</div>
    </div>
    <div class="about-text">
      <div class="section-tag">About Me</div>
      <h2>Hey, I'm Pavan</h2>
      <p>I'm a frontend developer passionate about building clean and modern web interfaces. I enjoy turning designs into pixel-perfect, responsive websites.</p>
      <p>When I'm not coding, I'm exploring new design trends, learning new technologies, and working on personal projects to sharpen my skills.</p>
      <div class="about-stats">
        <div class="stat-item">
          <div class="stat-num">5+</div>
          <div class="stat-lbl">Projects</div>
        </div>
        <div class="stat-item">
          <div class="stat-num">3+</div>
          <div class="stat-lbl">Technologies</div>
        </div>
        <div class="stat-item">
          <div class="stat-num">100%</div>
          <div class="stat-lbl">Dedication</div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- CONTACT -->
<section id="contact">
  <div class="contact-inner">
    <div class="section-tag">Get In Touch</div>
    <h2>Let's Work Together</h2>
    <p class="section-desc">Have a project in mind? I'd love to hear from you. Let's build something great!</p>
    <div class="contact-links">
      <a href="mailto:baddiPavan6302@gmail.com" class="contact-link">
        ✉️ baddiPavan6302@gmail.com
      </a>
      <a href="https://github.com/baddiPavan-6302" target="_blank" class="contact-link">
        💻 GitHub
      </a>
      <a href="https://linkedin.com/in/baddiPavan" target="_blank" class="contact-link">
        🔗 LinkedIn
      </a>
    </div>
  </div>
</section>

<!-- FOOTER -->
<footer>
  <div>Designed & Built by <span>Pavan</span> ✦</div>
  <div>© 2025 baddiPavan-6302</div>
</footer>

<script>
  // Custom cursor
  const cursor = document.getElementById('cursor');
  const ring = document.getElementById('cursorRing');
  let mx = 0, my = 0, rx = 0, ry = 0;
  document.addEventListener('mousemove', e => { mx = e.clientX; my = e.clientY; });
  function animateCursor() {
    cursor.style.left = mx - 5 + 'px';
    cursor.style.top  = my - 5 + 'px';
    rx += (mx - rx) * 0.12;
    ry += (my - ry) * 0.12;
    ring.style.left = rx - 18 + 'px';
    ring.style.top  = ry - 18 + 'px';
    requestAnimationFrame(animateCursor);
  }
  animateCursor();

  // Skill bar animation on scroll
  const observer = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.querySelectorAll('.skill-fill').forEach(f => f.classList.add('animated'));
      }
    });
  }, { threshold: 0.3 });
  document.querySelector('.skills-section') && observer.observe(document.querySelector('.skills-section'));
</script>
</body>
</html>
