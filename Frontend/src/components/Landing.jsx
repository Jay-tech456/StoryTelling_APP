import React, { useState, useEffect } from 'react';
import './Landing.css';

function Landing(props) {
  const [stars, setStars] = useState([]);

  useEffect(() => {
    const starsArray = [];
    for (let i = 0; i < 50; i++) {
      starsArray.push({
        id: i,
        left: Math.random() * 100 + '%',
        top: Math.random() * 100 + '%',
        size: Math.random() * 3 + 1 + 'px',
        delay: Math.random() * 2 + 's'
      });
    }
    setStars(starsArray);
  }, []);

  return (
    <section {...props} className="section landing-section">
      <div className="stars">
        {stars.map(star => (
          <div
            key={star.id}
            className="star"
            style={{
              left: star.left,
              top: star.top,
              width: star.size,
              height: star.size,
              animationDelay: star.delay
            }}
          />
        ))}
      </div>

      <h1 className="landing-h1">Welcome to the Campfire</h1>

      <p className="landing-description">Share your stories around the virtual fire...</p>

      <div className="campfire">
        <div className="campfire-ground">
          <div className="fire">
            <div className="flame"></div>
            <div className="flame"></div>
            <div className="flame"></div>
          </div>
          <div className="campfire-log-horizontal"></div>
          <div className="campfire-log-vertical"></div>
        </div>

        <div className="people">
          <div className="person" title="Storyteller 1">
            <div className="person-head"></div>
          </div>
          <div className="person" title="Storyteller 2">
            <div className="person-head"></div>
          </div>
          <div className="person" title="Storyteller 3">
            <div className="person-head"></div>
          </div>
        </div>
      </div>

      <p className="landing-continue-text">Scroll down to continue your journey...</p>
    </section>
  );
}

export default Landing;
