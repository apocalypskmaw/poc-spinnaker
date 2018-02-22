#!/usr/bin/env python

from locust import HttpLocust, TaskSet, task


class DefaultBehavior(TaskSet):
    """Default TaskSet Class"""

    @task
    def load_page(self):
        """Load home page"""
        self.client.get('')


class Default(HttpLocust):
    """Default Locust Class"""
    task_set = DefaultBehavior
    min_wait = 3000
    max_wait = 10000
