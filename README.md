# Ruby Guild

Code examples for Bitrise Ruby Guild meetings.

For more information about the Guild, see our [Wiki page](https://bitrise.atlassian.net/wiki/spaces/EGR/overview).

## About Ruby

Ruby was created by Yukihiro “Matz” Matsumoto and its first public release was in 1995.

The Ruby language was created around the core tenet that good software is written for people, not for computers. 
Take a look at this very simple code example:

```c++
#include <iostream>
using namespace std;

int main()
{
    int n, sum = 0;

    cout << "Enter a positive integer: ";
    cin >> n;

    for (int i = 1; i <= n; ++i) {
        sum += i;
    }

    cout << "Sum = " << sum;
    return 0;
}
```

As far as problems go they don't come any simpler, but does this program seem like it was written for humans to read 
or for computers to execute? Now compare this with the following Ruby equivalent:

```ruby
print 'Enter a positive integer: '
n = readline.to_i
sum = 1.upto(n).sum
print "Sum = #{sum}"
```

To achieve its ideal, one of Ruby's primary goals is to provide you with tools to express yourself as freely as possible - 
to make programming "natural". It won't stop you from writing crappy code, no language can do that, but if you 
master it then you'll have the ability and the opportunity to write exceptional software, and not all languages 
can stake such a claim.

The downside of this freedom is that Ruby is a very rich language syntactically and it takes a long time to master. 
It has very few restrictions and provides little guidance around the usage of its tools so you have lots of opportunities
to mess up while you're still gathering experience. Ironically, programmers coming from other languages often find 
Ruby's natural approach to writing software quite alien and often complain about it being "magic" when they first
start learning the language.

### The Ideals of Ruby’s Creator

(from [ruby-lang.org](https://www.ruby-lang.org/en/about/))

Ruby is a language of careful balance. Its creator, Yukihiro “Matz” Matsumoto, blended parts of his favorite languages 
(Perl, Smalltalk, Eiffel, Ada, and Lisp) to form a new language that balanced functional programming with imperative programming.

He has often said that he is “trying to make Ruby natural, not simple,” in a way that mirrors life.

Building on this, he adds:

> Ruby is simple in appearance, but is very complex inside, just like our human body.

### Philosophy

(from [Wikipedia](https://en.wikipedia.org/wiki/Ruby_(programming_language)#Philosophy))

Matsumoto has said that Ruby is designed for programmer productivity and fun, following the principles of good user 
interface design. At a Google Tech Talk in 2008 Matsumoto further stated,

> I hope to see Ruby help every programmer in the world to be productive, and to enjoy programming, and to be happy. 
> That is the primary purpose of Ruby language.

He stresses that systems design needs to emphasize human, rather than computer, needs:

> Often people, especially computer engineers, focus on the machines. They think, "By doing this, the machine will run fast. By doing this, the machine will run more effectively. By doing this, the machine will something something something." They are focusing on machines. But in fact we need to focus on humans, on how humans care about doing programming or operating the application of the machines. We are the masters. They are the slaves.
