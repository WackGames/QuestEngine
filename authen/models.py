from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.

class User(AbstractUser):
    email = models.EmailField(verbose_name='email', max_length=255, unique=True)
    role = models.CharField(max_length=40, blank=False, default="general")
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name', 'role']
    USERNAME_FIELD = 'email'

    def get_username(self):
        return self.email
    
    def get_role(self):
        return self.role
