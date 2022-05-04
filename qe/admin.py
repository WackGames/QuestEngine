from django.contrib import admin
from .models import Question, Quiz, Game

# Register your models here.

admin.site.register(Question)
admin.site.register(Quiz)
admin.site.register(Game)
