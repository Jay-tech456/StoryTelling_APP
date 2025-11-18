import React, { useState, useEffect } from 'react';
import axios from 'axios';
import useSpeechRecognition from '../Middleware/useSpeechRecognition';

function Projects(props) {
  const [story, setStory] = useState('');
  const [sessionId, setSessionId] = useState(Math.random().toString(36).substring(7));
  const [responses, setResponses] = useState([]);
  const [loading, setLoading] = useState(false);

  const {
    isListening,
    transcript,
    error,
    startListening,
    hasSupport
  } = useSpeechRecognition();

  // Automatically send transcript when speech recognition completes
  useEffect(() => {
    if (transcript && transcript.trim()) {
      setStory(transcript);
      handleSubmit(transcript);
    }
  }, [transcript]);

  const handleSubmit = async (storyText = story) => {
    if (!storyText.trim()) return;

    setLoading(true);
    console.log('Sending request to backend:', storyText);
    try {
      const response = await axios.post('http://localhost:8000/gemini/generate', {
        session_id: sessionId,
        prompt: storyText
      });
      console.log('Received response:', response.data);
      setResponses([...responses, { user: storyText, ai: response.data.response }]);
      setStory('');
      console.log('Story added to responses');
    } catch (error) {
      console.error('Error details:', error);
      console.error('Error response:', error.response);
      console.error('Error message:', error.message);
      alert(`Failed to get AI response: ${error.message}. Check console for details.`);
    }
    setLoading(false);
  };

  const handleTextSubmit = (e) => {
    e.preventDefault();
    handleSubmit();
  };

  const handleSpeakAndSubmit = () => {
    if (hasSupport) {
      startListening();
    } else {
      alert('Speech recognition is not supported in this browser.');
    }
  };

  return (
    <section {...props} className="section" style={{
      background: 'linear-gradient(to bottom, #0f3460, #16213e, #0c0c0c)'
    }}>
      <h2 style={{
        fontSize: '42px',
        marginBottom: '20px',
        color: '#ff7f50',
        textShadow: '2px 2px 4px rgba(0,0,0,0.5)'
      }}>
        Tell Your Story
      </h2>

      <div style={{
        maxWidth: '700px',
        width: '100%',
        padding: '20px',
        background: 'rgba(0, 0, 0, 0.7)',
        borderRadius: '10px',
        boxShadow: '0 4px 20px rgba(0, 0, 0, 0.5)',
        marginBottom: '20px'
      }}>
        <div style={{ marginBottom: '20px' }}>
          {/* Speech Recognition Button */}
          <button
            onClick={handleSpeakAndSubmit}
            disabled={isListening || loading}
            style={{
              padding: '12px 20px',
              fontSize: '16px',
              background: isListening ? '#ff4500' : '#228b22',
              color: '#fff',
              border: 'none',
              borderRadius: '5px',
              cursor: loading || isListening ? 'not-allowed' : 'pointer',
              marginBottom: '10px',
              opacity: loading || isListening ? 0.6 : 1,
              display: 'flex',
              alignItems: 'center',
              gap: '8px'
            }}
          >
            {isListening ? '🎤 Listening...' : '🎤 Tell Story by Voice'}
          </button>

          <form onSubmit={handleTextSubmit} style={{ marginTop: '10px' }}>
          <textarea
            value={story}
            onChange={(e) => setStory(e.target.value)}
            placeholder="Share your story here..."
            style={{
              width: '100%',
              height: '120px',
              padding: '15px',
              fontSize: '16px',
              border: 'none',
              borderRadius: '5px',
              background: '#1a1a1a',
              color: '#fff',
              resize: 'vertical',
              marginBottom: '10px'
            }}
          />
          <button
            type="submit"
            disabled={loading}
            style={{
              padding: '10px 20px',
              fontSize: '16px',
              background: '#ff7f50',
              color: '#fff',
              border: 'none',
              borderRadius: '5px',
              cursor: loading ? 'not-allowed' : 'pointer',
              opacity: loading ? 0.6 : 1
            }}
          >
            {loading ? 'Sending...' : 'Share Story'}
          </button>
          </form>
        </div>

        <div style={{ textAlign: 'left' }}>
          {responses.map((res, index) => (
            <div key={index} style={{
              marginBottom: '20px',
              padding: '15px',
              background: '#2c2c2e',
              borderRadius: '5px'
            }}>
              <p style={{ color: '#ff7f50', marginBottom: '10px' }}>
                <strong>You said:</strong> {res.user}
              </p>
              <p style={{ color: '#fff', lineHeight: '1.6' }}>
                <strong>Listeners responded:</strong> {res.ai}
              </p>
            </div>
          ))}
        </div>

        {responses.length === 0 && !loading && (
          <>
            <p style={{ color: '#ccc', textAlign: 'center', marginBottom: '10px' }}>
              Start sharing your story to hear from the attentive listeners around the fire!
            </p>
            {!hasSupport && (
              <p style={{ color: '#888', textAlign: 'center', fontSize: '14px' }}>
                Note: Voice input requires a modern browser (Chrome/Edge recommended) and may need HTTPS for full functionality.
              </p>
            )}
          </>
        )}
      </div>
    </section>
  );
}

export default Projects;
