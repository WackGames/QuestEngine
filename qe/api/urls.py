from django.urls import path
from qe.api.views import (working_api)

app_name = 'EM'
urlpatterns = [
        path(f'', working_api, name='working'),
]