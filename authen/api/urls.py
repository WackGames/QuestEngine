from django.urls import path, include
from authen.api.views import (ApiAuthView, ResetView, PatchUserView)

app_name = 'QE'
urlpatterns = [
        path('', include('djoser.urls'), name='Auth Working'),
        path('', include('djoser.urls.authtoken'), name='Auth Working')
]