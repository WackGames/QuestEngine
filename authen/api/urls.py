from django.urls import path, include
from authen.api.views import (ApiAuthView)

app_name = 'QE'
urlpatterns = [
        path(f'', include('djoser.urls'), name='Auth Working'),
        path(f'', include('djoser.urls.authtoken'), name='Auth Working'),

]