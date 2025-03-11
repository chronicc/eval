import datetime
import streamlit as st

st.title("Test Form")

now = datetime.datetime.now()

##
# Form Validation
#
if "first_name" not in st.session_state:
    st.session_state.first_name = ""
if "second_name" not in st.session_state:
    st.session_state.second_name = ""
if "date" not in st.session_state:
    st.session_state.date = now.date()
if "time" not in st.session_state:
    st.session_state.time = now.time()
if "number" not in st.session_state:
    st.session_state.number = 42

##
# Actual Form
#
st.header("Form Input")

with st.form("my_form"):
    left_column, right_column = st.columns(2)
    left_column.text_input("First name", key="first_name")
    right_column.text_input("Second name", key="second_name")
    left_column.date_input("Select a date", key="date")
    right_column.time_input("Select a time", key="time")

    st.number_input("Select a number", 1, 100, key="number")

    st.slider("Select a range of values", 1, 100, (42, 69))

    st.text("Select a direction")
    st.checkbox("North")
    st.checkbox("East")
    st.checkbox("South")
    st.checkbox("West")

    st.color_picker("Select a color", "#00f900")

    st.text("How are you feeling today?")
    st.feedback("faces")

    st.radio("Select your gender", ["Male", "Female", "Diverse"])

    st.multiselect(
        "Select your favorite fruits", ["Apple", "Banana", "Orange", "Grapefruit"]
    )

    st.selectbox("Select a country", ["Germany", "France", "Italy", "USA"])

    st.select_slider("Select a value", options=[1, 2, 3, 4, 5])

    st.toggle("Press the button")

    st.text_area("Type a long message")

    st.audio_input("Upload an audio file")

    st.file_uploader("Upload a file")

    st.camera_input("Take a picture")

    st.form_submit_button("Submit")

##
# Form Results
#
st.header("Form Results")

st.write("First name:", st.session_state.first_name)
st.write("Second name:", st.session_state.second_name)
st.write("Date:", st.session_state.date.strftime("%d.%m.%Y"))
st.write("Time:", st.session_state.time.strftime("%H:%M"))
st.write("Number:", st.session_state.number)
