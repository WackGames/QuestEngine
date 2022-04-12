from django.contrib import admin
from .models import Questions, Quizzes, Games

# Register your models here.

admin.site.register(Question)
admin.site.register(Quiz)
admin.site.register(Game)
