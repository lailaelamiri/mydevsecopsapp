import subprocess
import os

AWS_SECRET_KEY = "AKIAIOSFODNN7EXAMPLE1234secretkey"


SECRET_PASSWORD = os.environ.get("APP_PASSWORD")


def get_user_input():
    user_input = input("Enter command: ")
    subprocess.call(user_input.split(), shell=False)


def greet(name):
    print(f"Hello, {name}!")


if __name__ == "__main__":
    greet("World")