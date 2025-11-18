import React, { useState } from 'react';
import Header from './components/Header';
import Landing from './components/Landing';
import About from './components/About';
import Projects from './components/Projects';
import Footer from './components/Footer';
import './App.css';

function App() {
  const [currentSection, setCurrentSection] = useState('landing');

  const scrollToSection = (section) => {
    document.getElementById(section).scrollIntoView({ behavior: 'smooth' });
    setCurrentSection(section);
  };

  return (
    <div className="App">
      <Header currentSection={currentSection} scrollToSection={scrollToSection} />
      <Landing id="landing" />
      <About id="about" />
      <Projects id="projects" />
      <Footer id="footer" />
    </div>
  );
}

export default App;
