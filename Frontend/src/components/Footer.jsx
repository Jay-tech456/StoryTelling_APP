import React from 'react';

function Footer(props) {
  return (
    <section {...props} className="section" style={{
      background: '#0c0c0c'
    }}>
      <div style={{
        textAlign: 'center',
        padding: '40px 20px'
      }}>
        <p style={{
          fontSize: '18px',
          color: '#fff',
          marginBottom: '20px'
        }}>
          Thank you for sharing around the campfire.
        </p>

        <p style={{
          fontSize: '16px',
          color: '#ccc',
          marginBottom: '10px'
        }}>
          Built with ❤️ using React, FastAPI, and Gemini AI
        </p>

        <p style={{
          fontSize: '14px',
          color: '#888'
        }}>
          © 2025 Campfire Storytelling App. All rights reserved.
        </p>
      </div>
    </section>
  );
}

export default Footer;
