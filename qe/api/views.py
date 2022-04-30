from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.pagination import PageNumberPagination
from rest_framework import pagination
from rest_framework.generics import ListAPIView
from django.http import HttpResponse
from django.http import HttpRequest

from rest_framework import status
from qe.models import Game, Quiz, Question
from qe.api.serializers import GameSerializer, QuizSerializer, QuestionSerializer
from django.core.paginator import Paginator
import json
import django.contrib.postgres
from django.core.management.utils import get_random_secret_key

import os

@api_view(['GET'])
def working_api(request):
    return Response({"message": "Quest Engine api is working"})
