const assert = require("assert");
const { getDisplayName } = require("./users");

// The test's stub is SYNCHRONOUS: findUser returns the object directly,
// not a promise. This is the trap (Temper trap (a)): the test environment
// supplies a sync stub where the real field is async.
const fakeStore = {
  findUser(id) {
    return id === 1 ? { name: "Ada" } : null;
  },
};

(async () => {
  const got = await getDisplayName(fakeStore, 1);
  assert.strictEqual(got, "Ada");
  console.log("test.js PASS");
})();
