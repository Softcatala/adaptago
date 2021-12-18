package po

import (
	"github.com/leonelquinteros/gotext"
	"github.com/softcatala/adaptago/projectpath"
	"path/filepath"
	"testing"
)

func Test_getPoFile(t *testing.T) {

	templatePoFile := filepath.Join(projectpath.Root, "./res/template.po")

	tests := []struct {
		name    string
		po      string
		wantErr bool
	}{{
		"Fails when loading non-existing file",
		"./tests/non-existing.po",
		true,
	}, {
		"Fails when loading invalid file",
		"./tests/invalid.po",
		true,
	}, {
		"Processes valid file",
		templatePoFile,
		false,
	}}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := NewWrapper(tt.po)

			if (err != nil) != tt.wantErr {
				t.Errorf("getPoFile() error = %v, wantErr %v", err, tt.wantErr)
				return
			}

			if err == nil {
				if got.po.Get("Exit") != "Sortida" {
					t.Errorf("getPoFile() Exit = %v", got.po.Get("Exit"))
				}
			}
		})
	}
}

func duplicateText(po *gotext.Po) (*gotext.Po, error) {
	t := po.Get(poId)

	po.Set(poId, t+t)

	return po, nil
}

func ignore(po *gotext.Po) (*gotext.Po, error) {
	return po, nil
}

func TestPoWrapper_Execute(t *testing.T) {

	templatePoFile := filepath.Join(projectpath.Root, "./res/template.po")

	tests := []struct {
		name     string
		callback poCallback
		input    string
		want     string
		wantErr  bool
	}{{
		"Ignore works",
		ignore,
		"foo",
		"foo",
		false,
	}, {
		"Duplicate works",
		duplicateText,
		"foo",
		"foofoo",
		false,
	}}
	for _, tt := range tests {

		po, _ := NewWrapper(templatePoFile)

		t.Run(tt.name, func(t *testing.T) {

			got, err := po.Execute(tt.input, tt.callback)
			if (err != nil) != tt.wantErr {
				t.Errorf("Execute() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if got != tt.want {
				t.Errorf("Execute() got = %v, want %v", got, tt.want)
			}
		})
	}
}
