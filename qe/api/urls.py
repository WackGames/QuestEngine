from django.urls import path
from qe.api.views import (working_api, ApiSingleGameView, ApiAllGamesView, ApiAllQuizzesView, ApiSingleQuizView, ApiUserQuizView, ApiAllQuestionsView, ApiSingleQuestionView, ApiQuizQuestionView, ApiSelectedQuizQuestionView, ApiAllDemoQuizzesView, ApiSingleDemoQuizView, ApiAllDemoQuestionsView, ApiAllDemoQuizQuestionsView, ApiSingleDemoQuizQuestionView)

app_name = 'QE'
urlpatterns = [
        path('', working_api, name='working'),
        path('game/', ApiAllGamesView.as_view(), name='all_games_api'),
        path('game/<str:pk>/', ApiSingleGameView.as_view(), name='single_game_view'),
        path('quiz/', ApiAllQuizzesView.as_view(), name='all_quizzes_api'),
        path('user-quiz/', ApiUserQuizView.as_view(), name='all_user_quizzes_api'),
        path('user-quiz/<str:pk>/', ApiSingleQuizView.as_view(), name='single_user_quiz_api'),

        path('demo-quiz/', ApiAllDemoQuizzesView.as_view(), name='all_demo_quizzes_api'),
        path('demo-quiz/<str:pk>/', ApiSingleDemoQuizView.as_view(), name='single_demo_quiz_api'),

        path('question/', ApiAllQuestionsView.as_view(), name='all_questions_api'),
        path('demo-question/', ApiAllDemoQuestionsView.as_view(), name='all_questions_api'),

        path('quiz-question/', ApiQuizQuestionView.as_view(), name='all_quiz_questions_api'),
        path('quiz-question/<str:pk>/', ApiSingleQuestionView.as_view(), name='all_quiz_questions_api'),
        path('demo-quiz-question/', ApiAllDemoQuizQuestionsView.as_view(), name='all_questions_api'),
        path('demo-quiz-question/<str:pk>/', ApiSingleDemoQuizQuestionView.as_view(), name='all_questions_api'),

        path('selected-quiz-question/', ApiSelectedQuizQuestionView.as_view(), name='selected_quiz_questions_api'),

]