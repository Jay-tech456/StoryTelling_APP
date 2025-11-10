from fastapi import APIRouter, Request
from pydantic import BaseModel
import os



router = APIRouter( 
    prefix="/save",
    tags=["save"],
)


router.get("/session")
def fetch_session_data(request: Request):
    """Fetch session data for the user."""

    return {"message": "Session data fetched successfully."}

