const { db, getDisplayName } = require("./users");

// Real usage: the actual async db, not a stub.
(async () => {
  const name = await getDisplayName(db, 1);
  console.log("run.js output:", name);
})();
