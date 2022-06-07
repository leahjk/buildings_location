from django.contrib.gis.db import models


class Building(models.Model):
    name = models.CharField(max_length=100)
    location = models.PointField()
    address = models.CharField(max_length=100)
    city = models.CharField(max_length=50)


class Meta:
    verbose_name = ("Building")
    verbose_name_plural = ("Buildings")
    ordering = ['-yearofmanufacture']

    def __str__(self):
        return self.type
