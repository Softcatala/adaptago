package adapter

import (
	"errors"
	"github.com/leonelquinteros/gotext"
	"github.com/rwtodd/Go.Sed/sed"
	"os"
)

const poId = "Exit"

type poWrapperRunner struct {
	e  *sed.Engine
	po *gotext.Po
}

func (r poWrapperRunner) run(i string) (string, error) {
	r.po.Set(poId, i)

	b, err := r.po.MarshalText()

	if err != nil {
		return "", err
	}

	output, err := r.e.RunString(string(b))

	if err != nil {
		return "", err
	}

	po := gotext.NewPo()
	po.Parse([]byte(output))

	o := po.Get(poId)

	return o, nil
}

func NewPoFileRunner(rf string, pf string) (sedRunner, error) {

	r, err := os.Open(rf)

	if err != nil {
		return nil, err
	}

	po, err := getPoFile(pf)

	if err != nil {
		return nil, err
	}

	e, err := sed.New(r)

	if err != nil {
		return nil, err
	} else {
		return &poWrapperRunner{e, po}, nil
	}
}

func getPoFile(empty string) (*gotext.Po, error) {

	po := gotext.NewPo()
	po.ParseFile(empty)

	if po.Get(poId) == poId {
		return nil, errors.New("Could not load empty po file")
	}

	return po, nil
}
