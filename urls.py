from rest_framework import routers
from .views import TaskViewSet
from django.urls import path, include

router = routers.DefaultRouter()
router.register(r'tasks', TaskViewSet, basename='task')

urlpatterns = [
    path('', include(router.urls)),
]
