op <- options(device = function(...) {
  pdf(file = NULL)
  dev.control("enable")
})

context("Evaluation: graphics")

test_that("single plot is captured", {
  ev <- evaluate(file("plot.r"))
  expect_that(length(ev), equals(2))

  expect_that(classes(ev), equals(c("source", "recordedplot")))
})

test_that("ggplot is captured", {
  if (require("ggplot2")) {
    ev <- evaluate(file("ggplot.r"))
    expect_that(length(ev), equals(3))

    expect_that(classes(ev),
                equals(c("source", "source", "recordedplot")))
  }
})

test_that("plot additions are captured", {
  ev <- evaluate(file("plot-additions.r"))
  expect_that(length(ev), equals(4))

  expect_that(classes(ev),
              equals(c("source", "recordedplot", "source", "recordedplot")))
})

test_that("blank plots by plot.new() are preserved", {
  ev <- evaluate(file("plot-new.r"))
  expect_that(length(ev), equals(10))

  expect_that(classes(ev),
              equals(rep(c("source", "recordedplot"), 5)))
})

test_that("base plots in a single expression are captured", {
  ev <- evaluate(file("plot-loop.r"))
  expect_that(length(ev), equals(4))

  expect_that(classes(ev),
              equals(c("source", rep("recordedplot", 3))))
})

test_that("ggplot2 plots in a single expression are captured", {
  if (require("ggplot2")) {
    ev <- evaluate(file("ggplot-loop.r"))
    expect_that(length(ev), equals(4))

    expect_that(classes(ev),
                equals(c(rep("source", 2), rep("recordedplot", 2))))
  }
})

test_that("multirow graphics are captured only when complete", {
  ev <- evaluate(file("plot-multi.r"))

  expect_that(classes(ev),
              equals(c(rep("source", 5), "recordedplot")))

})

test_that("multirow graphics are captured on close", {
  ev <- evaluate(file("plot-multi-missing.r"))

  expect_that(classes(ev),
              equals(c(rep("source", 4), "recordedplot")))
})

test_that("plots are captured in a non-rectangular layout", {
  ev <- evaluate(file("plot-multi-layout.r"))

  expect_that(classes(ev),
              equals(rep(c("source", "recordedplot"), c(1, 3))))

  ev <- evaluate(file("plot-multi-layout2.r"))

  expect_that(classes(ev),
              equals(rep(c("source", "recordedplot"), c(4, 2))))
})

test_that("changes in parameters don't generate new plots", {
  ev <- evaluate(file("plot-par.r"))
  expect_that(classes(ev),
              equals(c("source", "recordedplot", "source", "source", "recordedplot")))
})

test_that("plots in a loop are captured even the changes seem to be from par only", {
  ev <- evaluate(file("plot-par2.r"))
  expect_that(classes(ev),
              equals(c("source", "recordedplot")[c(1, 2, 1, 1, 2, 2, 2)]))
})

test_that("strwidth()/strheight() should not produce new plots", {
  ev <- evaluate(file("plot-strwidth.r"))
  expect_that(classes(ev),
              equals(rep(c("source", "recordedplot"), c(4, 1))))
})

test_that("clip() does not produce new plots", {
  ev <- evaluate(file("plot-clip.r"))
  expect_that(classes(ev),
              equals(c("source", "recordedplot")[c(1, 2, 1, 1, 2)]))
})

test_that("perspective plots are captured", {
  ev <- evaluate(file("plot-persp.r"))
  expect_that(classes(ev),
              equals(rep(c("source", "recordedplot"), c(6, 3))))
})

test_that("an incomplete plot with a comment in the end is also captured", {
  ev <- evaluate(file("plot-last-comment.r"))
  expect_that(classes(ev),
              equals(rep(c("source", "recordedplot"), c(3, 1))))
})

# test_that("no plot windows open", {
#   graphics.off()
#   expect_that(length(dev.list()), equals(0))
#   evaluate(file("plot.r"))
#   expect_that(length(dev.list()), equals(0))
# })

options(op)

test_that("by default, evaluate() always records plots regardless of the device", {
  op <- options(device = pdf)
  ev <- evaluate("plot(1)")
  options(op)
  expect_that(length(ev), equals(2))
})
