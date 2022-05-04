from django.db import models
from django.contrib.postgres.fields import ArrayField, JSONField

# Create your models here.

class Game(models.Model):
    name = models.CharField(max_length=40, blank=False)
    description = models.CharField(max_length=400, blank=True)
    img_url = models.CharField(max_length=400, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class Quiz(models.Model):
    user_id = models.CharField(max_length=40, blank=False)
    name = models.CharField(max_length=40, blank=False)
    description = models.CharField(max_length=400, blank=True)
    img_url = models.CharField(max_length=400, blank=True)
    category = models.CharField(max_length=40, blank=False)
    subcategory = models.CharField(max_length=40, blank=True)
    best_score = models.DecimalField(decimal_places=2, max_digits=8, blank=True)
    best_time = models.DecimalField(decimal_places=2, max_digits=8, blank=True)
    time_limit = models.DecimalField(decimal_places=2, max_digits=8, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    curr_score = models.DecimalField(decimal_places=2, max_digits=8, blank=True)
    curr_time = models.DecimalField(decimal_places=2, max_digits=8, blank=True)
    tags = models.JSONField(blank=True)

    def __str__(self):
        return self.name

class Question(models.Model):
    quiz_id = models.ForeignKey(Quiz, on_delete=models.CASCADE,)
    img_url = models.CharField(max_length=400, blank=True)
    question = models.TextField(blank=False)
    answer = ArrayField(models.TextField(), blank=False)
    solution = ArrayField(models.TextField(), blank=False)
    best_time = models.DecimalField(decimal_places=2, max_digits=8, blank=True)
    time_limit = models.DecimalField(decimal_places=2, max_digits=8, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    tags = models.JSONField(blank=True)

    def __str__(self):
        return self.question
