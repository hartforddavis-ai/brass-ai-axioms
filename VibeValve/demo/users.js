const db = {
  async findUser(id) {
    await new Promise((r) => setTimeout(r, 10));
    return id === 1 ? { name: "Ada" } : null;
  },
};

async function getDisplayName(store, id) {
  const user = store.findUser(id); // BUG: no await
  return user.name;
}

module.exports = { db, getDisplayName };
