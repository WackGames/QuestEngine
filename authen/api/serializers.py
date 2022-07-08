from djoser.serializers import UserCreateSerializer, UserSerializer
from rest_framework import serializers
from authen.models import User
from rest_framework.generics import ListAPIView


class UserCreateSerializer(UserCreateSerializer):
    class Meta(UserCreateSerializer.Meta):
        model = User
        fields = ('id', 'email', 'username', 'password', 'first_name', 'last_name', 'role')
