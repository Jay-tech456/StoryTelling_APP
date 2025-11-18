@echo off
cd Frontend\myapp\src\components

echo Creating Landing.jsx...
(
echo import React, { useState, useEffect } from 'react';
echo import './Landing.css';
echo.
echo function Landing(props) { 
echo   const [stars, setStars] = useState([]);
echo.
echo   useEffect(() => {
echo     const starsArray = [];
echo     for (let i = 0; i ^< 50; i++) {
echo       starsArray.push({
echo         id: i,
echo         left: Math.random() * 100 + '%%',
echo         top: Math.random() * 100 + '%%',
echo         size: Math.random() * 3 + 1 + 'px',
echo         delay: Math.random() * 2 + 's'
echo       });
echo     }
echo     setStars(starsArray);
echo   }, []);
echo.
echo   return (
echo     ^<section {...props} className="section landing-section"^>
echo       ^<div className="stars"^>
echo         {stars.map(star =^> (
echo           ^<div
echo             key={star.id}
echo             className="star"
echo             style={{
echo               left: star.left,
echo               top: star.top,
echo               width: star.size,
echo               height: star.size,
echo               animationDelay: star.delay
echo             }}
echo           /^>
echo         ))}
echo       ^</div^>
echo.
echo       ^<h1 className="landing-h1"^>Welcome to the Campfire^</h1^>
echo.
echo       ^<p className="landing-description"^>Share your stories around the virtual fire...^</p^>
echo.
echo       ^<div className="campfire"^>
echo         ^<div className="campfire-ground"^>
echo           ^<div className="fire"^>
echo             ^<div className="flame"^>^</div^>
echo             ^<div className="flame"^>^</div^>
echo             ^<div className="flame"^>^</div^>
echo           ^</div^>
echo           ^<div className="campfire-log-horizontal"^>^</div^>
echo           ^<div className="campfire-log-vertical"^>^</div^>
echo         ^</div^>
echo         ^<div className="people"^>
echo           ^<div className="person" title="Storyteller 1"^>
echo             ^<div className="person-head"^>^</div^>
echo           ^</div^>
echo           ^<div className="person" title="Storyteller 2"^>
echo             ^<div className="person-head"^>^</div^>
echo           ^</div^>
echo           ^<div className="person" title="Storyteller 3"^>
echo             ^<div className="person-head"^>^</div^>
echo           ^</div^>
echo         ^</div^>
echo       ^</div^>
echo       ^<p className="landing-continue-text"^>Scroll down to continue your journey...^</p^>
echo     ^</section^>
echo   );
echo }
echo.
echo export default Landing;
) > Landing.jsx

echo Creating About.css...
(
echo /* About Section */
echo.
echo .about-section {
echo   background: linear-gradient(to bottom, #16213e, #0f3460, #16213e);
echo }
echo.
echo .about-section h2 {
echo   font-size: 42px;
echo   margin-bottom: 20px;
echo   color: #ff7f50;
echo   text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
echo }
echo.
echo .about-content {
echo   max-width: 600px;
echo   text-align: left;
echo   padding: 0 20px;
echo }
echo.
echo .about-description {
echo   font-size: 18px;
echo   line-height: 1.6;
echo   color: #ffffff;
echo   margin-bottom: 20px;
echo }
echo.
echo .about-description:last-of-type {
echo   margin-bottom: 0;
echo }
) > About.css

echo Creating About.jsx...
(
echo import React from 'react';
echo import './About.css';
echo.
echo function About(props) {
echo   return (
echo     ^<section {...props} className="section about-section"^>
echo       ^<h2>About the Campfire^</h2^>
echo.
echo       ^<div className="about-content"^>
echo         ^<p className="about-description"^>
echo           Gather around the virtual campfire and share your stories with attentive listeners powered by AI.
echo           Our app creates a safe, immersive environment where you can tell your tales and receive thoughtful responses.
echo         ^</p^>
echo         ^<p className="about-description"^>
echo           Built with love using React for the frontend and FastAPI for the backend,
echo           integrated with Google's Gemini AI for natural conversation responses.
echo         ^</p^>
echo         ^<p className="about-description"^>
echo           Features three AI-powered listeners that take turns to show understanding,
echo           ask clarifying questions, and help you feel heard in this cozy digital space.
echo         ^</p^>
echo       ^</div^>
echo     ^</section^>
echo   );
echo }
echo.
echo export default About;
) > About.jsx

echo Creating Projects.css...
(
echo /* Projects Section - Storytelling */
echo.
echo .projects-section {
echo   background: linear-gradient(to bottom, #0f3460, #16213e, #0c0c0c);
echo }
echo.
echo .projects-section h2 {
echo   font-size: 42px;
echo   margin-bottom: 20px;
echo   color: #ff7f50;
echo   text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
echo }
echo.
echo .projects-container {
echo   max-width: 700px;
echo   width: 100%%;
echo   padding: 20px;
echo   background: rgba(0, 0, 0, 0.7);
echo   border-radius: 10px;
echo   box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
echo   margin-bottom: 20px;
echo }
echo.
echo .input-section {
echo   margin-bottom: 20px;
echo }
echo.
echo .voice-button {
echo   padding: 12px 20px;
echo   font-size: 16px;
echo   background: #228b22;
echo   color: #fff;
echo   border: none;
echo   border-radius: 5px;
echo   cursor: pointer;
echo   margin-bottom: 10px;
echo   display: flex;
echo   align-items: center;
echo   gap: 8px;
echo   transition: all 0.3s ease;
echo }
echo.
echo .voice-button.listening {
echo   background: #ff4500;
echo   animation: pulse 1.5s infinite;
echo }
echo.
echo @keyframes pulse {
echo   0%% { opacity: 1; }
echo   50%% { opacity: 0.7; }
echo   100%% { opacity: 1; }
echo }
echo.
echo .voice-button:disabled {
echo   opacity: 0.6;
echo   cursor: not-allowed;
echo }
echo.
echo .story-textarea {
echo   width: 100%%;
echo   height: 120px;
echo   padding: 15px;
echo   font-size: 16px;
echo   border: none;
echo   border-radius: 5px;
echo   background: #1a1a1a;
echo   color: #fff;
echo   resize: vertical;
echo   margin-bottom: 10px;
echo }
echo.
echo .submit-button {
echo   padding: 10px 20px;
echo   font-size: 16px;
echo   background: #ff7f50;
echo   color: #fff;
echo   border: none;
echo   border-radius: 5px;
echo   cursor: pointer;
echo   transition: opacity 0.3s ease;
echo }
echo.
echo .submit-button:disabled {
echo   opacity: 0.6;
echo   cursor: not-allowed;
echo }
echo.
echo .conversations {
echo   text-align: left;
echo }
echo.
echo .conversation-item {
echo   margin-bottom: 20px;
echo   padding: 15px;
echo   background: #2c2c2e;
echo   border-radius: 5px;
echo   border-left: 4px solid #ff7f50;
echo }
echo.
echo .user-message {
echo   color: #ff7f50;
echo   margin-bottom: 10px;
echo }
echo.
echo .ai-response {
echo   color: #fff;
echo   line-height: 1.6;
echo }
echo.
echo .empty-state {
echo   color: #ccc;
echo   text-align: center;
echo   margin-bottom: 10px;
echo }
echo.
echo .browser-warning {
echo   color: #888;
echo   text-align: center;
echo   font-size: 14px;
echo   background: rgba(255, 255, 255, 0.05);
echo   padding: 10px;
echo   border-radius: 5px;
echo   border-left: 3px solid #ffa500;
echo }
) > Projects.css

echo Creating Projects.jsx...
(
echo import React, { useState, useEffect } from 'react';
echo import axios from 'axios';
echo import useSpeechRecognition from '../Middleware/useSpeechRecognition';
echo import './Projects.css';
echo.
echo function Projects(props) {
echo   const [story, setStory] = useState('');
echo   const [sessionId, setSessionId] = useState(Math.random().toString(36).substring(7));
echo   const [responses, setResponses] = useState([]);
echo   const [loading, setLoading] = useState(false);
echo.
echo   const {
echo     isListening,
echo     transcript,
echo     error,
echo     startListening,
echo     hasSupport
echo   } = useSpeechRecognition();
echo.
echo   useEffect(() =^> {
echo     if (transcript ^&^& transcript.trim()) {
echo       setStory(transcript);
echo       handleSubmit(transcript);
echo     }
echo   }, [transcript]);
echo.
echo   const handleSubmit = async (storyText = story) =^> {
echo     if (!storyText.trim()) return;
echo.
echo     setLoading(true);
echo     try {
echo       const response = await axios.post('http://localhost:8000/gemini/generate', {
echo         session_id: sessionId,
echo         prompt: storyText
echo       });
echo       setResponses([...responses, { user: storyText, ai: response.data.response }]);
echo       setStory('');
echo     } catch (error) {
echo       console.error('Error:', error);
echo       alert('Failed to get AI response. Is the backend running?');
echo     }
echo     setLoading(false);
echo   };
echo.
echo   const handleTextSubmit = (e) =^> {
echo     e.preventDefault();
echo     handleSubmit();
echo   };
echo.
echo   const handleSpeakAndSubmit = () =^> {
echo     if (hasSupport) {
echo       startListening();
echo     } else {
echo       alert('Speech recognition is not supported in this browser.');
echo     }
echo   };
echo.
echo   return (
echo     ^<section {...props} className="section projects-section"^>
echo       ^<h2>Tell Your Story^</h2^>
echo.
echo       ^<div className="projects-container"^>
echo         ^<div className="input-section"^>
echo           ^<button
echo             onClick={handleSpeakAndSubmit}
echo             disabled={isListening ^|^| loading}
echo             className={`voice-button ${isListening ? 'listening' : ''}`}
echo           ^>
echo             {isListening ? '🎤 Listening...' : '🎤 Tell Story by Voice'}
echo           ^</button^>
echo.
echo           ^<form onSubmit={handleTextSubmit}^>
echo             ^<textarea
echo               value={story}
echo               onChange={(e) =^> setStory(e.target.value)}
echo               placeholder="Share your story here..."
echo               className="story-textarea"
echo             /^>
echo             ^<button
echo               type="submit"
echo               disabled={loading}
echo               className="submit-button"
echo             ^>
echo               {loading ? 'Sending...' : 'Share Story'}
echo             ^</button^>
echo           ^</form^>
echo         ^</div^>
echo.
echo         ^<div className="conversations"^>
echo           {responses.map((res, index) =^> (
echo             ^<div key={index} className="conversation-item"^>
echo               ^<p className="user-message"^>
echo                 ^<strong^>You said:^</strong^> {res.user}
echo               ^</p^>
echo               ^<p className="ai-response"^>
echo                 ^<strong^>Listeners responded:^</strong^> {res.ai}
echo               ^</p^>
echo             ^</div^>
echo           ))}
echo         ^</div^>
echo.
echo         {responses.length === 0 ^&^& !loading ^&^& (
echo           ^<^>
echo             ^<p className="empty-state"^>
echo               Start sharing your story to hear from the attentive listeners around the fire!
echo             ^</p^>
echo             {!hasSupport ^&^& (
echo               ^<div className="browser-warning"^>
echo                 Note: Voice input requires a modern browser (Chrome/Edge recommended) and may need HTTPS for full functionality.
echo               ^</div^>
echo             )}
echo           ^</^>
echo         )}
echo       ^</div^>
echo     ^</section^>
echo   );
echo }
echo.
echo export default Projects;
) > Projects.jsx

echo Creating Footer.css...
(
echo /* Footer Section */
echo.
echo .footer {
echo   background: #0c0c0c;
echo }
echo.
echo .footer-content {
echo   text-align: center;
echo   padding: 40px 20px;
echo }
echo.
echo .footer-thanks {
echo   font-size: 18px;
echo   color: #fff;
echo   margin-bottom: 20px;
echo }
echo.
echo .footer-tech {
echo   font-size: 16px;
echo   color: #ccc;
echo   margin-bottom: 10px;
echo }
echo.
echo .footer-copyright {
echo   font-size: 14px;
echo   color: #888;
echo }
) > Footer.css

echo Creating Footer.jsx...
(
echo import React from 'react';
echo import './Footer.css';
echo.
echo function Footer(props) {
echo   return (
echo     ^<section {...props} className="section footer"^>
echo       ^<div className="footer-content"^>
echo         ^<p className="footer-thanks"^>Thank you for sharing around the campfire.^</p^>
echo         ^<p className="footer-tech"^>Built with ❤️ using React, FastAPI, and Gemini AI^</p^>
echo         ^<p className="footer-copyright"^>© 2025 Campfire Storytelling App. All rights reserved.^</p^>
echo       ^</div^>
echo     ^</section^>
echo   );
echo }
echo.
echo export default Footer;
) > Footer.jsx

echo Deleting temporary batch file...
