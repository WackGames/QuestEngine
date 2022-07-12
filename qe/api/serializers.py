from rest_framework import serializers

from qe.models import Game, Quiz, Question, DemoQuiz, DemoQuestion

class GameSerializer(serializers.ModelSerializer):
    class Meta:
        model = Game
        fields = ('__all__')

class QuizSerializer(serializers.ModelSerializer):
    class Meta:
        model = Quiz
        fields = ('__all__')

class DemoQuizSerializer(serializers.ModelSerializer):
    class Meta:
        model = DemoQuiz
        fields = ('__all__')

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ('__all__')

class DemoQuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = DemoQuestion
        fields = ('__all__')
