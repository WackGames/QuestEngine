from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated, IsAdminUser

from rest_framework.pagination import PageNumberPagination
from rest_framework import pagination
from rest_framework.generics import ListAPIView
from django.http import HttpResponse
from django.http import HttpRequest, Http404

from rest_framework import status
from qe.models import Game, Quiz, DemoQuiz, Question, DemoQuestion
from qe.api.serializers import GameSerializer, QuizSerializer, DemoQuizSerializer, QuestionSerializer, DemoQuestionSerializer
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

class NoPagination(PageNumberPagination):
    page_size = 500
    page_size_query_param = 'page_size'

    def get_paginated_response(self, data):
        return Response({
            'count': self.page.paginator.count,
            'results': data
        })


@api_view(['GET'])
def working_api(request):
    return Response({"message": "Quest Engine api is working"})

# @permission_classes([IsAuthenticated])
class ApiAllGamesView(ListAPIView):
    serializer_class = GameSerializer
    pagination_class = StandardResultsSetPagination
    order_cat = self.request.headers['order'] or "id"
    def get_queryset(self):
        return Game.objects.all().order_by(order_cat)
    def post(self, request):
        serializer = GameSerializer(data=request.data)
        if serializer.is_valid():
            print(serializer, 'is valid')
            serializer.save()
        else:
            print('it isnt valid!', serializer.errors)
            return Response(serializer.errors)
        return Response(serializer.data)

class ApiSingleGameView(ListAPIView):
    def get_object(self, pk):
        try:
            return Game.objects.get(pk=pk)
        except Game.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        game = self.get_object(pk)
        serializer = GameSerializer(game)
        return Response(serializer.data)

    def patch(self, request, pk):
        game = self.get_object(pk)
        serializer = GameSerializer(game, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        game = self.get_object(pk)
        game.delete()
        return Response({"message": "Game Deleted Successfully!"}, status=status.HTTP_204_NO_CONTENT)



class ApiAllQuizzesView(ListAPIView):
    serializer_class = QuizSerializer
    pagination_class = StandardResultsSetPagination
    permission_classes = [IsAuthenticated, IsAdminUser]
    order_cat = self.request.headers['order'] or "id"
    def get_queryset(self):
        return Quiz.objects.all().order_by(order_cat)

class ApiUserQuizView(ListAPIView):
    serializer_class = QuizSerializer
    pagination_class = StandardResultsSetPagination
    permission_classes = [IsAuthenticated]
    order_cat = self.request.headers['order'] or "id"
    def get_queryset(self):
        return Quiz.objects.filter(user_id=self.request.headers['userid']).order_by(order_cat)
    def post(self, request):
        serializer = QuizSerializer(data=request.data)
        if serializer.is_valid():
            print(serializer, 'is valid')
            serializer.save()
        else:
            print('it isnt valid!', serializer.errors)
            return Response(serializer.errors)
        return Response(serializer.data)

class ApiSingleQuizView(ListAPIView):
    permission_classes = [IsAuthenticated]
    def get_object(self, pk):
        try:
            return Quiz.objects.get(pk=pk)
        except Quiz.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        quiz = self.get_object(pk)
        serializer = QuizSerializer(quiz)
        return Response(serializer.data)

    def patch(self, request, pk):
        quiz = self.get_object(pk)
        serializer = QuizSerializer(quiz, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST )

    def delete(self, request, pk):
        quiz = self.get_object(pk)
        quiz.delete()
        return Response({"message": "Quiz Deleted Successfully!"}, status=status.HTTP_204_NO_CONTENT)



class ApiAllQuestionsView(ListAPIView):
    serializer_class = QuestionSerializer
    pagination_class = StandardResultsSetPagination
    permission_classes = [IsAuthenticated, IsAdminUser]
    order_cat = self.request.headers['order'] or "id"
    def get_queryset(self):
        return Question.objects.all().order_by(order_cat)

class ApiQuizQuestionView(ListAPIView):
    serializer_class = QuestionSerializer
    pagination_class = StandardResultsSetPagination
    permission_classes = [IsAuthenticated]
    order_cat = self.request.headers['order'] or "id"
    def get_queryset(self):
        return Question.objects.filter(quiz_id=self.request.headers['quizid']).order_by(order_cat)

    def post(self, request):
        serializer = QuestionSerializer(data=request.data)
        if serializer.is_valid():
            print(serializer, 'is valid')
            serializer.save()
        else:
            print('it isnt valid!', serializer.errors)
            return Response(serializer.errors)
        return Response(serializer.data)

class ApiSelectedQuizQuestionView(ListAPIView):
    serializer_class = QuestionSerializer
    pagination_class = NoPagination
    permission_classes = [IsAuthenticated]
    order_cat = self.request.headers['order'] or "id"
    def get_queryset(self):
        return Question.objects.filter(quiz_id=self.request.headers['quizid']).order_by(order_cat)

class ApiSingleQuestionView(ListAPIView):
    permission_classes = [IsAuthenticated]
    def get_object(self, pk):
        try:
            return Question.objects.get(pk=pk)
        except Question.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        question = self.get_object(pk)
        serializer = QuestionSerializer(question)
        return Response(serializer.data)

    def patch(self, request, pk):
        question = self.get_object(pk)
        serializer = QuestionSerializer(question, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        question = self.get_object(pk)
        question.delete()
        return Response({"message": "Question Deleted Successfully!"}, status=status.HTTP_204_NO_CONTENT)



class ApiAllDemoQuizzesView(ListAPIView):
    serializer_class = DemoQuizSerializer
    pagination_class = StandardResultsSetPagination
    order_cat = self.request.headers['order'] or "id"
    def get_queryset(self):
        return DemoQuiz.objects.all().order_by(order_cat)

    def post(self, request):
        serializer = DemoQuizSerializer(data=request.data)
        if serializer.is_valid():
            print(serializer, 'is valid')
            serializer.save()
        else:
            print('it isnt valid!', serializer.errors)
            return Response(serializer.errors)
        return Response(serializer.data)

class ApiSingleDemoQuizView(ListAPIView):
    def get_object(self, pk):
        try:
            return DemoQuiz.objects.get(pk=pk)
        except DemoQuiz.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        quiz = self.get_object(pk)
        serializer = DemoQuizSerializer(quiz)
        return Response(serializer.data)

    def patch(self, request, pk):
        quiz = self.get_object(pk)
        serializer = DemoQuizSerializer(quiz, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        quiz = self.get_object(pk)
        quiz.delete()
        return Response({"message": "Demo Quiz Deleted Successfully!"}, status=status.HTTP_204_NO_CONTENT)


class ApiAllDemoQuestionsView(ListAPIView):
    serializer_class = DemoQuestionSerializer
    pagination_class = StandardResultsSetPagination
    order_cat = self.request.headers['order'] or "id"
    def get_queryset(self):
        return DemoQuestion.objects.all().order_by(order_cat)

class ApiAllDemoQuizQuestionsView(ListAPIView):
    serializer_class = DemoQuestionSerializer
    pagination_class = NoPagination
    def get_queryset(self):
        return DemoQuestion.objects.filter(quiz_id=self.request.headers['quizid']).order_by(self.request.headers['order'])
        
    def post(self, request):
        serializer = DemoQuestionSerializer(data=request.data)
        if serializer.is_valid():
            print(serializer, 'is valid')
            serializer.save()
        else:
            print('it isnt valid!', serializer.errors)
            return Response(serializer.errors)
        return Response(serializer.data)

class ApiSingleDemoQuizQuestionView(ListAPIView):
    def get_object(self, pk):
        try:
            return DemoQuestion.objects.get(pk=pk)
        except DemoQuestion.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        question = self.get_object(pk)
        serializer = DemoQuestionSerializer(question)
        return Response(serializer.data)

    def patch(self, request, pk):
        question = self.get_object(pk)
        serializer = DemoQuestionSerializer(question, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        question = self.get_object(pk)
        question.delete()
        return Response({"message": "Demo Question Deleted Successfully!"}, status=status.HTTP_204_NO_CONTENT)