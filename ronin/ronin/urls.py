"""ronin URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
from inventory import views

urlpatterns = [
    path('', views.index, name='index'),
    path('admin/', admin.site.urls),
    re_path(r'^accounts/$', views.AccountListView.as_view(), name='accounts'),
    re_path(r'^workstations/$', views.WorkstationListView.as_view(), name='workstations'),
    re_path(r'^software/$', views.SoftwareListView.as_view(), name='software'),
    re_path(r'^installed/$', views.InstalledListView.as_view(), name='installed'),
    re_path(r'^certificate/$', views.CertificateListView.as_view(), name='certificate'),
    re_path(r'accounts/(?P<pk>\d+)$', views.AccountDetailView.as_view(), name='account-detail'),
    re_path(r'workstation/(?P<pk>\d+)$', views.WorkstationDetailView.as_view(), name='workstation-detail'),
    re_path(r'installed/(?P<pk>\d+)$', views.InstalledDetailView.as_view(), name='installed-detail'),
    re_path(r'software/(?P<pk>\d+)$', views.SoftwareDetailView.as_view(), name='software-detail'),
    re_path(r'certificate/(?P<pk>\d+)$', views.CertificateDetailView.as_view(), name='certificate-detail'),
]
