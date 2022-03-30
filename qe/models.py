
from django.db import models
from django.contrib.postgres.fields import ArrayField

# Create your models here.

class Questions(models.Model):
    quiz_id = models.ForeignKey,
    img_url = models.CharField(max_length=200, blank=True),
    question = models.CharField(blank=False),
    answer = ArrayField(models.CharField(), blank=False),
    solution = ArrayField(models.CharField(), blank=False),
    best_time = models.DecimalField(decimal_places=2, max_digits=8, blank=True),
    time_limit = models.DecimalField(decimal_places=2, max_digits=8, blank=True),
    tags = models.TextField(blank=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.question


