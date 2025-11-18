import React from 'react';
import './Header.css';

function Header({ currentSection, scrollToSection }) {
  return (
    <header className="header">
      <nav className="nav">
        <ul className="nav-list">
          <li className="nav-item">
            <button
              onClick={() => scrollToSection('landing')}
              className={`nav-button ${currentSection === 'landing' ? 'active' : ''}`}
            >
              Landing
            </button>
          </li>
          <li className="nav-item">
            <button
              onClick={() => scrollToSection('about')}
              className={`nav-button ${currentSection === 'about' ? 'active' : ''}`}
            >
              About
            </button>
          </li>
          <li className="nav-item">
            <button
              onClick={() => scrollToSection('projects')}
              className={`nav-button ${currentSection === 'projects' ? 'active' : ''}`}
            >
              Stories
            </button>
          </li>
          <li className="nav-item">
            <button
              onClick={() => scrollToSection('footer')}
              className={`nav-button ${currentSection === 'footer' ? 'active' : ''}`}
            >
              Footer
            </button>
          </li>
        </ul>
      </nav>
    </header>
  );
}

export default Header;
