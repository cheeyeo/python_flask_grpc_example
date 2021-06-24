from flask import Flask, render_template
import grpc
from recommendations_pb2 import BookCategory, RecommendationRequest
from recommendations_pb2_grpc import RecommendationsStub
import os


app = Flask(__name__)

recommendations_host = os.getenv("RECOMMENDATIONS_HOST", "localhost")
recommendations_channel = grpc.insecure_channel(f"{recommendations_host}:50051")
recommendations_client = RecommendationsStub(recommendations_channel)

@app.route("/")
def render_homepage():
    req = RecommendationRequest(user_id=1, category=BookCategory.MYSTERY, max_results=3)

    resp = recommendations_client.Recommend(req)

    return render_template("index.html", recommendations=resp.recommendations)