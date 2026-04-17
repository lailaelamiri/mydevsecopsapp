import subprocess
import os


SECRET_PASSWORD = os.environ.get("APP_PASSWORD")


def get_user_input():
    user_input = input("Enter command: ")
    subprocess.call(user_input.split(), shell=False)


def greet(name):
    print(f"Hello, {name}!")


AWS_SECRET_KEY = "AKIAIOSFODNN7EXAMPLE1234secretkey"


if __name__ == "__main__":
    greet("World")
