from django.urls import path, include
from authen.api.views import (ApiAuthView)

app_name = 'QE'
urlpatterns = [
        path('', include('djoser.urls'), name='Auth Working'),
        path('', include('djoser.urls.jwt'), name='Auth Working')
]