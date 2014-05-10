-- This is just a combinatorics problem.
-- There are 20 horizontal steps and 20 vertical steps. So if we choose the
-- 20 horizontal steps, we know that all the other steps must be vertical. So
-- this is equal to
-- 40! / (20! * 20!) according to Newtons binomial
main = print $ product [21..40] / product [1..20]
