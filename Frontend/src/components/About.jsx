import React from 'react';
import './About.css';

function About(props) {
  return (
    <section {...props} className="section about-section">
      <h2>About the Campfire</h2>

      <div className="about-content">
        <p className="about-description">
          Gather around the virtual campfire and share your stories with attentive listeners
          powered by AI. Our app creates a safe, immersive environment where you can tell
          your tales and receive thoughtful responses.
        </p>

        <p className="about-description">
          Built with love using React for the frontend and FastAPI for the backend,
          integrated with Google's Gemini AI for natural conversation responses.
        </p>

        <p className="about-description">
          Features three AI-powered listeners that take turns to show understanding,
          ask clarifying questions, and help you feel heard in this cozy digital space.
        </p>
      </div>
    </section>
  );
}

export default About;
