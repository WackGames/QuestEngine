from django.urls import path
from qe.api.views import (working_api, ApiSingleGameView, ApiAllGamesView, ApiAllQuizzesView, ApiSingleQuizView, ApiUserQuizView, ApiAllQuestionsView, ApiSingleQuestionView, ApiQuizQuestionView, ApiSelectedQuizQuestionView)

app_name = 'EM'
urlpatterns = [
        path(f'', working_api, name='working'),
        path(f'game/', ApiAllGamesView.as_view(), name='all_games_api'),
        path(f'game/<str:pk>/', ApiSingleGameView.as_view(), name='single_game_view'),
        path(f'quiz/', ApiAllQuizzesView.as_view(), name='all_quizzes_api'),
        path(f'user-quiz/', ApiUserQuizView.as_view(), name='all_user_quizzes_api'),
        path(f'user-quiz/<str:pk>/', ApiSingleQuizView.as_view(), name='single_user_quiz_api'),

        path(f'question/', ApiAllQuestionsView.as_view(), name='all_questions_api'),
        path(f'quiz-question/', ApiQuizQuestionView.as_view(), name='all_quiz_questions_api'),
        path(f'quiz-question/<str:pk>/', ApiSingleQuestionView.as_view(), name='all_quiz_questions_api'),
        path(f'selected-quiz-question/', ApiSelectedQuizQuestionView.as_view(), name='selected_quiz_questions_api'),

]