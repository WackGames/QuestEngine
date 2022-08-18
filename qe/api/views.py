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
import requests
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
    return Response(
        {
            "message": "Quest Engine api is working",
            "endpoints": {
                "/authen/users/": [
                    {
                    "operation": "GET",
                    "description": "This will grab all of the app's users or single user depending on permissions."
                    },
                    {
                    "operation": "POST",
                    "description": "This will allow a user to register with the app."
                    }
                ],
                "/authen/users/me/": [
                    {
                    "operation": "GET",
                    "description": "This will grab the logged in user."
                    },
                    {
                    "operation": "PUT",
                    "description": "This will allow a user to edit user information except email and password. Username is required."
                    },
                    {
                    "operation": "DELETE",
                    "description": "This will allow a user to delete their account. Password is required."
                    }
                ],
                "/authen/users/set_password/": [
                    {
                    "operation": "POST",
                    "description": "This will allow a user to set a new password."
                    }
                ],
                "/authen/users/set_email/": [
                    {
                    "operation": "POST",
                    "description": "This will allow a user to set a new email."
                    }
                ],
                "/authen/jwt/create/": [
                    {
                    "operation": "POST",
                    "description": "This will allow a user to log into the app."
                    }
                ],
                "/authen/jwt/refresh/": [
                    {
                    "operation": "POST",
                    "description": "This will allow a user to get a new valid access token. A refresh token is required."
                    }
                ],
                "/authen/jwt/verify/": [
                    {
                    "operation": "POST",
                    "description": "This will allow a user to check if a given token is valid. A token is required."
                    }
                ],
                "/authen/users/reset_password/": [
                    {
                    "operation": "POST",
                    "description": "This will allow an email to be sent to a user who lost their password."
                    }
                ],
                "/authen/users/reset_password_confirm/": [
                    {
                    "operation": "POST",
                    "description": "This will allow a user to create a new password if they forgot their old one."
                    }
                ],
                "/game/": [
                    {
                    "operation": "GET",
                    "description": "This will grab all of the basic game data."
                    },
                    {
                    "operation": "POST",
                    "description": "This will allow a user to add a game."
                    }
                ],
                "/game/<id>/": [
                    {
                    "operation": "GET",
                    "description": "This will grab a single game and its data."
                    },
                    {
                    "operation": "PATCH",
                    "description": "This will allow a user to edit a game."
                    },
                    {
                    "operation": "DELETE",
                    "description": "This will allow a user to delete a game."
                    }
                ],
                "/quiz/": [
                    {
                    "operation": "GET",
                    "description": "This will grab all of the app's quizzes from every user. Being logged in is required. Being a super admin is required."
                    }
                ],
                "/user-quiz/": [
                    {
                    "operation": "GET",
                    "description": "This will grab all of the user's quizzes. Being logged in is required. A user id is required."
                    },
                    {
                    "operation": "POST",
                    "description": "This will allow a user to add another quiz. Being logged in is required. A user id is required."
                    }
                ],
                "/user-quiz/<id>": [
                    {
                    "operation": "GET",
                    "description": "This will grab a single quiz and its data. Being logged in is required."
                    },
                    {
                    "operation": "PATCH",
                    "description": "This will allow a user to edit a quiz. Being logged in is required."
                    },
                    {
                    "operation": "DELETE",
                    "description": "This will allow a user to delete a quiz. Being logged in is required."
                    }
                ],
                "/demo-quiz/": [
                    {
                    "operation": "GET",
                    "description": "This will grab all of the demo quizzes."
                    },
                    {
                    "operation": "POST",
                    "description": "This will allow a user to add a demo quiz."
                    }
                ],
                "/demo-quiz/<id>/": [
                    {
                    "operation": "GET",
                    "description": "This will grab a single demo quiz."
                    },
                    {
                    "operation": "PATCH",
                    "description": "This will allow a user to edit a demo quiz."
                    },
                    {
                    "operation": "DELETE",
                    "description": "This will allow a user to delete a demo quiz."
                    }
                ],
                "/question/": [
                    {
                    "operation": "GET",
                    "description": "This will grab all of the app's quiz questions from all users. Being a super admin is required."
                    }
                ],
                "/demo-question/": [
                    {
                    "operation": "GET",
                    "description": "This will grab all of the app's demo quiz questions from every quiz."
                    }
                ],
                "/demo-quiz-question/": [
                    {
                    "operation": "GET",
                    "description": "This will grab all of the app's demo quiz questions from a single quiz. A quiz id is required."
                    },
                    {
                    "operation": "POST",
                    "description": "This will allow a user to add a demo quiz question."
                    }
                ],
                "/demo-quiz-question/<id>/": [
                    {
                    "operation": "GET",
                    "description": "This will grab a single demo quiz question."
                    },
                    {
                    "operation": "PATCH",
                    "description": "This will allow a user to edit a demo quiz question."
                    },
                    {
                    "operation": "DELETE",
                    "description": "This will allow a user to delete a demo quiz question."
                    }
                ],
                "/quiz-question/": [
                    {
                    "operation": "GET",
                    "description": "This will grab all of a user's quiz questions from a single quiz WITH pagination. Being logged in is required. A quiz id is also required."
                    },
                    {
                    "operation": "POST",
                    "description": "This will allow a user to add a quiz question. Being logged in is required."
                    }
                ],
                "/quiz-question/<id>/": [
                    {
                    "operation": "GET",
                    "description": "This will grab a single question from a user's quiz. Being logged in is required."
                    },
                    {
                    "operation": "PATCH",
                    "description": "This will allow a user to edit a quiz question. Being logged in is required."
                    },
                    {
                    "operation": "DELETE",
                    "description": "This will allow a user to delete a quiz question. Being logged in is required."
                    }
                ],
                "/selected-quiz-question/": [
                    {
                    "operation": "GET",
                    "description": "This will grab all of a user's quiz questions from a single quiz WITHOUT pagination. Being logged in is required. A quiz id is also required."
                    }
                ]                           
            }
    })

# @permission_classes([IsAuthenticated])
class ApiAllGamesView(ListAPIView):
    serializer_class = GameSerializer
    pagination_class = StandardResultsSetPagination
    def get_queryset(self):
        try:
            order_cat = self.request.headers['order']
        except:
            order_cat = "id"
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
    def get_queryset(self):
        try:
            order_cat = self.request.headers['order']
        except:
            order_cat = "id"
        return Quiz.objects.all().order_by(order_cat)

class ApiUserQuizView(ListAPIView):
    serializer_class = QuizSerializer
    pagination_class = StandardResultsSetPagination
    permission_classes = [IsAuthenticated]
    def get_queryset(self):
        try:
            order_cat = self.request.headers['order']
        except:
            order_cat = "id"

        token = self.request.headers['Authorization']
        headers = {'Authorization': token}
        user_data = requests.get("http://127.0.0.1:8000/authen/users/me/", headers=headers)
        user_data = user_data.json()["id"]
        quiz_data = self.request.headers['userid']
        print(user_data, quiz_data)
        owner = user_data == int(quiz_data)
        if owner:
            return Quiz.objects.filter(user_id=self.request.headers['userid']).order_by(order_cat)
        else:
            return Quiz.objects.none()
            
    def post(self, request):
        token = self.request.headers['Authorization']
        headers = {'Authorization': token}
        user_data = requests.get("http://127.0.0.1:8000/authen/users/me/", headers=headers)
        user_data = user_data.json()["id"]
        quiz_data = request.data["user_id"]
        owner = user_data == int(quiz_data)

        if not owner:
            return Response({"message": "You do not own this user id!"})
        
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
            token = self.request.headers['Authorization']
            headers = {'Authorization': token}
            user_data = requests.get("http://127.0.0.1:8000/authen/users/me/", headers=headers)
            user_data = user_data.json()["id"]
            quiz_data = Quiz.objects.get(pk=pk).user_id
            owner = user_data == int(quiz_data)
            print(user_data, quiz_data)
            if owner:
                return Quiz.objects.get(pk=pk)
            else:
                return "None"
        except Quiz.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        try:
            quiz = self.get_object(pk)
            serializer = QuizSerializer(quiz)
            return Response(serializer.data)
        except:
            return Response({"message": "You do not own this quiz!"})

    def patch(self, request, pk):
        try:
            quiz = self.get_object(pk)
            serializer = QuizSerializer(quiz, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST )
        except:
            return Response({"message": "You do not own this quiz!"})

    def delete(self, request, pk):
        try:
            quiz = self.get_object(pk)
            quiz.delete()
            return Response({"message": "Quiz Deleted Successfully!"}, status=status.HTTP_204_NO_CONTENT)
        except:
            return Response({"message": "You do not own this quiz!"})


class ApiAllQuestionsView(ListAPIView):
    serializer_class = QuestionSerializer
    pagination_class = StandardResultsSetPagination
    permission_classes = [IsAuthenticated, IsAdminUser]
    def get_queryset(self):
        try:
            order_cat = self.request.headers['order']
        except:
            order_cat = "id"
        return Question.objects.all().order_by(order_cat)

class ApiQuizQuestionView(ListAPIView):
    serializer_class = QuestionSerializer
    pagination_class = StandardResultsSetPagination
    permission_classes = [IsAuthenticated]
    def get_queryset(self):
        try:
            order_cat = self.request.headers['order']
        except:
            order_cat = "id"
        token = self.request.headers['Authorization']
        headers = {'Authorization': token}
        user_data = requests.get("http://127.0.0.1:8000/authen/users/me/", headers=headers)
        user_data = user_data.json()["id"]
        try:
            question_data = Question.objects.filter(quiz_id=self.request.headers['quizid'])[0].user_id
        except:
            return Quiz.objects.none()
        owner = user_data == int(question_data)
        if owner:
            return Question.objects.filter(quiz_id=self.request.headers['quizid']).order_by(order_cat)
        else:
            return Quiz.objects.none()

    def post(self, request):
        token = self.request.headers['Authorization']
        headers = {'Authorization': token}
        user_data = requests.get("http://127.0.0.1:8000/authen/users/me/", headers=headers)
        user_data = user_data.json()["id"]
        quiz_data = request.data["user_id"]
        owner = user_data == int(quiz_data)

        if not owner:
            return Response({"message": "You do not own this user id!"})

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
    def get_queryset(self):
        try:
            order_cat = self.request.headers['order']
        except:
            order_cat = "id"
        token = self.request.headers['Authorization']
        headers = {'Authorization': token}
        user_data = requests.get("http://127.0.0.1:8000/authen/users/me/", headers=headers)
        user_data = user_data.json()["id"]
        question_data = Question.objects.filter(quiz_id=self.request.headers['quizid'])[0].user_id
        print(user_data, question_data)
        owner = user_data == int(question_data)
        if owner:
            print("return results!")
            return Question.objects.filter(quiz_id=self.request.headers['quizid']).order_by(order_cat)
        else:
            print("return none!")
            return Quiz.objects.none()
            
class ApiSingleQuestionView(ListAPIView):
    permission_classes = [IsAuthenticated]
    def get_object(self, pk):
        try:
            token = self.request.headers['Authorization']
            headers = {'Authorization': token}
            user_data = requests.get("http://127.0.0.1:8000/authen/users/me/", headers=headers)
            user_data = user_data.json()["id"]
            question_data = Question.objects.get(pk=pk).user_id
            owner = user_data == int(question_data)
            print(user_data, question_data)
            if owner:
                return Question.objects.get(pk=pk)
            else:
                return "None"
        except Question.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        try:
            question = self.get_object(pk)
            serializer = QuestionSerializer(question)
            return Response(serializer.data)
        except:
            return Response({"message": "You do not own this question!"})

    def patch(self, request, pk):
        try:
            question = self.get_object(pk)
            serializer = QuestionSerializer(question, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response({"message": "You do not own this question!"})

    def delete(self, request, pk):
        try:
            question = self.get_object(pk)
            question.delete()
            return Response({"message": "Question Deleted Successfully!"}, status=status.HTTP_204_NO_CONTENT)
        except:
            return Response({"message": "You do not own this question!"})
 


class ApiAllDemoQuizzesView(ListAPIView):
    serializer_class = DemoQuizSerializer
    pagination_class = StandardResultsSetPagination
    def get_queryset(self):
        try:
            order_cat = self.request.headers['order']
        except:
            order_cat = "id"
        return DemoQuiz.objects.all().order_by(order_cat)

    # def post(self, request):
    #     serializer = DemoQuizSerializer(data=request.data)
    #     if serializer.is_valid():
    #         print(serializer, 'is valid')
    #         serializer.save()
    #     else:
    #         print('it isnt valid!', serializer.errors)
    #         return Response(serializer.errors)
    #     return Response(serializer.data)

class ApiSingleDemoQuizView(ListAPIView):
    permission_classes = [IsAdminUser]
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
    permission_classes = [IsAdminUser]
    def get_queryset(self):
        try:
            order_cat = self.request.headers['order']
        except:
            order_cat = "id"
        return DemoQuestion.objects.all().order_by(order_cat)

class ApiAllDemoQuizQuestionsView(ListAPIView):
    serializer_class = DemoQuestionSerializer
    pagination_class = NoPagination
    def get_queryset(self):
        try:
            order_cat = self.request.headers['order']
        except:
            order_cat = "id"
        return DemoQuestion.objects.filter(quiz_id=self.request.headers['quizid']).order_by(order_cat)
        
    # def post(self, request):
    #     serializer = DemoQuestionSerializer(data=request.data)
    #     if serializer.is_valid():
    #         print(serializer, 'is valid')
    #         serializer.save()
    #     else:
    #         print('it isnt valid!', serializer.errors)
    #         return Response(serializer.errors)
    #     return Response(serializer.data)

class ApiSingleDemoQuizQuestionView(ListAPIView):
    permission_classes = [IsAdminUser]
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