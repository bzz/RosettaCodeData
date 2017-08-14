    int sum1 = Arrays.stream(myIntArray)
        .map(y_ -> {
          int x_ = y_ * y_ * y_;
          out.println(x_);
          return x_;
        })
        .reduce(0, (il, ir) -> il + ir); // <-- could substitute .sum() for .reduce(...) here.
