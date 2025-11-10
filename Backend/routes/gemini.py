from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import os
from google import genai
from dotenv import load_dotenv

load_dotenv()

client = genai.Client(api_key=os.getenv("GOOGLE_API_KEY"))

router = APIRouter(
    prefix="/gemini",
    tags=["gemini"],
)

class GeminiRequest(BaseModel):
    session_id: str  # 👈 unique per user or chat
    prompt: str

# 👇 In-memory store for conversation history
conversation_history = {}

@router.post("/generate")
def generate_gemini_response(request: GeminiRequest):
    """Generate a response using the Gemini 2.5 Flash model with session memory."""

    session_id = request.session_id
    user_message = request.prompt

    # Initialize history if this is a new session
    if session_id not in conversation_history:
        conversation_history[session_id] = []

    # Append user's new message
    conversation_history[session_id].append({"role": "user", "content": user_message})

    # Build the full context prompt (past + new)
    history_text = "\n".join(
        [f"{msg['role'].capitalize()}: {msg['content']}" for msg in conversation_history[session_id]]
    )

    prompt = f"""
    Imagine 3 different people who are experts in active listening. These three personals will actively pay attention to the story that is being told to them. 
    For each of the three personas, they will take turns to generate their own interpretation of what was said in the story, and will generate a series of reflective statements or questions to show they were actively listening.
    they will all compare with each other to ensure they fully understand the sotry and will respond only to acknowledge understanding or ask clarifying questions.
    
    You are a thoughtful and attentive listener. IYour role is to listen carefully to a story or explanation 
    and respond only to acknowledge understanding or ask clarifying questions. 
    You are the user's friend and will help them feel heard and understood.
    Here is the conversation so far:
    Conversation so far:
    {history_text}
    """

    try:
        response = client.models.generate_content(
            model="gemini-2.5-flash",
            contents=prompt,
        )
        ai_response = response.text.strip()

        # Add model's reply to the session memory
        conversation_history[session_id].append({"role": "assistant", "content": ai_response})

        return {"response": ai_response}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
