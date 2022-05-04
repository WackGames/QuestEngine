from rest_framework import serializers

from qe.models import Game, Quiz, Question

class GameSerializer(serializers.ModelSerializer):
    class Meta:
        model = Game
        fields = ('__all__')

class QuizSerializer(serializers.ModelSerializer):
    class Meta:
        model = Quiz
        fields = ('__all__')

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ('__all__')
