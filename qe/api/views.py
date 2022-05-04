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

class StandardResultsSetPagination(PageNumberPagination):
    page_size = 16
    page_size_query_param = 'page_size'

    def get_paginated_response(self, data):
        return Response({
            'links': {
               'next': self.get_next_link(),
               'previous': self.get_previous_link()
            },
            'count': self.page.paginator.count,
            'current_page': self.request.GET.get('page'),
            'total_pages': self.page.paginator.num_pages,
            'results': data
        })


@api_view(['GET'])
def working_api(request):
    return Response({"message": "Quest Engine api is working"})

class ApiAllGamesView(ListAPIView):
    serializer_class = GameSerializer
    pagination_class = StandardResultsSetPagination
    def get_queryset(self):
        return Game.objects.all().order_by(self.request.headers['order'])

class ApiAllQuizzesView(ListAPIView):
    serializer_class = QuizSerializer
    pagination_class = StandardResultsSetPagination
    def get_queryset(self):
        return Quiz.objects.all().order_by(self.request.headers['order'])

class ApiUserQuizView(ListAPIView):
    serializer_class = QuizSerializer
    pagination_class = StandardResultsSetPagination
    def get_queryset(self):
        return Quiz.objects.filter(user_id=self.request.headers['userid']).order_by(self.request.headers['order'])

class ApiAllQuestionsView(ListAPIView):
    serializer_class = QuestionSerializer
    pagination_class = StandardResultsSetPagination
    def get_queryset(self):
        return Question.objects.all().order_by(self.request.headers['order'])

class ApiQuizQuestionView(ListAPIView):
    serializer_class = QuestionSerializer
    pagination_class = StandardResultsSetPagination
    # print(HttpRequest, "this is a request")
    # if request.headers['selected'] == True:
    #     pagination_class = None
    def get_queryset(self):
        return Question.objects.filter(quiz_id=self.request.headers['quizid']).order_by(self.request.headers['order'])