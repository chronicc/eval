Feature('browsing');

Scenario('test something', ({ I }) => {
  I.amOnPage('https://www.amazon.com/');
  I.see('Hello, Sign in');
});
