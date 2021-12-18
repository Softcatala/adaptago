package adapter

import (
	"errors"
	"github.com/rwtodd/Go.Sed/sed"
	"strings"
)

type Regexp struct {
	e *sed.Engine
}

func NewRegexp(r string) (*Regexp, error) {

	if r == "" {
		return nil, errors.New("Regexp is empty")
	}

	e, err := sed.New(strings.NewReader(r))

	if err != nil {
		return nil, err
	} else {
		return &Regexp{e}, nil
	}
}

func (r *Regexp) AdaptString(t string) (string, error) {
	o, err := r.e.RunString(t)

	if err != nil {
		return "", err
	}

	return strings.TrimRight(o, "\n"), nil
}
