import subprocess


SECRET_PASSWORD = "admin123"


def get_user_input():
    user_input = input("Enter command: ")
    subprocess.call(user_input, shell=True)


def greet(name):
    print(f"Hello, {name}!")


if __name__ == "__main__":
    greet("World")
