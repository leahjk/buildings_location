from django.contrib import admin
from django.contrib.gis.admin import OSMGeoAdmin
from .models import Building


admin.site.register(Building)

class BuildingsAdmin(OSMGeoAdmin):
    list_display = ('name', 'location')
    search_fields =('name', 'location')
