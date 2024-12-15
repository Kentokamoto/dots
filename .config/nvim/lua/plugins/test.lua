return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest" },
    opts = {
      adapters = {
        "neotest-plenary",
        ["neotest-jest"] = {
          jestCommmand = "npm run test-no-bail",
          env = { NODE_ENV = "test" },
          jestConfigFile = "jest.config.cjs",
        },
      },
    },
  },
}
