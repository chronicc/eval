import datetime
import streamlit as st

pg = st.navigation(
    [
        st.Page("pages/home.py", title="Home"),
        st.Page("pages/test_form.py", title="Test Form"),
    ]
)
pg.run()
