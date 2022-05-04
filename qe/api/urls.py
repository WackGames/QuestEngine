from django.urls import path
from qe.api.views import (working_api, ApiAllGamesView, ApiAllQuizzesView, ApiUserQuizView, ApiAllQuestionsView, ApiQuizQuestionView)

app_name = 'EM'
urlpatterns = [
        path(f'', working_api, name='working'),
        path(f'game/', ApiAllGamesView.as_view(), name='all_games_api'),
        path(f'quiz/', ApiAllQuizzesView.as_view(), name='all_quizzes_api'),
        path(f'user-quiz/', ApiUserQuizView.as_view(), name='all_user_quizzes_api'),
        path(f'question/', ApiAllQuestionsView.as_view(), name='all_questions_api'),
        path(f'quiz-question/', ApiQuizQuestionView.as_view(), name='all_quiz_questions_api'),
]